//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Michael Knepprath on 7/31/20.
//

import SwiftUI

// MARK: 1. Views and modifiers: Introduction
// Why does SwiftUI use structs for its views? Why does it use some View so much? How do modifiers really work?

// MARK: 2. Why does SwiftUI use structs for views?
// Structs are simpler and faster than classes - better performance. UIKit & AppKit relied on classes.
// Classes had way more baggage due to inheritence, parents, etc. Structs are cheap.

// MARK: 3. What is behind the main SwiftUI view?
// "There is nothing behind our view." There is UIHostingController, the bridge between UIKit (iOS UI framework) & SwiftUI.
// "What you see is all that you have." Use Frame to fill space.
// Frame to fill the space:
// .frame(maxWidth: .infinity, maxHeight: .infinity)
// .background(Color.red)
// Including into the reserved safe area:
// .edgesIgnoringSafeArea(.all)

// MARK: 4. Why modifier order matters
// Our views only hold the exact data we give them.
// Each modifier creates a new struct with that modifier applied.
// Therefore the order matters.
// Applying color before frame means the frame gets put around the the view that had the color added.
// Applying the color after frame means the color gets applied to the framed view.
// You can think of it as though each modifier modifies what existed before it (doesn't actually work this way, but can think about it this way).
// For instance, adding padding and then color and then padding, etc, will create colored borders around a view.

// MARK: 5. Why does SwiftUI use “some View” for its view type?
// A type that conforms to view protocol but doesn't say what.
// We don't know what view type is coming back, but the compiler does.
// some View... seems to be defined by what's in it. So if you create a VStack with 2 items inside of it, it creates a TupleView with 2 items. TupleView can only handle up to 10 items, which is why you need to create separate groups if you need to specify more than 10 consecutive views.

// MARK: 6. Conditional modifiers
// Ternaries!
// Can't if/else directly in the body with different views bc some View means the body should be a consistent view. A View and a modified version of the View are different.

// MARK: 7. Environment modifiers
// Not all modifiers are not environment modifiers. .font() is an example of one. .blur() is not.

// MARK: 8. Views as properties
// Using properties can make body code clearer. And you can use modifiers on them.
// Properties seem to be variables with Views assigned to them.

// MARK: 9. View composition
// Views can be split into smaller views with no performance impact.
struct CapsuleText: View { // (9)
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundColor(.white) // <- Remove this, then you can apply separate colors to instances of these below.
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

// MARK: 10. Custom modifiers
// Didn't work that well in earlier versions of Swift, so be on the latest for this stuff.
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

// Don't forget! Modifying Views returns a new View.

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

// MARK: 11. Custom containers
// Not used often (probably).
// Creating a new stack, GridStack
struct GridStack<Content: View>: View { // Generics
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
//    @State private var useRedText = false (6)
    
//    var motto1: some View { Text("Draco dormiens") } // (8)
//    let motto2 = Text("nunquam titillandus")
    
//    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) { // <- @escaping allows you to store closures to use later one (11)
//        self.rows = rows
//        self.columns = columns
//        self.content = content
//    }
    
    var body: some View {
//        Text("Hello, world!").padding() // (2)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
//            .edgesIgnoringSafeArea(.all)
        
//        Button("Hello World") { // (3)
//            print(type(of: self.body))
//        }
//        .frame(width: 200, height: 200)
//        .background(Color.blue)
        
//        Text("Hello World") // (4)
//            .padding()
//            .background(Color.red)
//            .padding()
//            .background(Color.blue)
//            .padding()
//            .background(Color.green)
//            .padding()
//            .background(Color.yellow)
        
//        Button("Hello World") {
//            self.useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue) // (6)
        
//        VStack { (7)
//            Text("Gryffindor")
//                .font(.largeTitle) // Overrides the env modifier
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title) // Environment modifier
        
//        VStack { // (8)
//            motto1
//                .foregroundColor(.red)
//            motto2
//                .foregroundColor(.blue)
//        }
        
//        VStack(spacing: 10) { // (9)
//            CapsuleText(text: "First")
//                .foregroundColor(.white)
//            CapsuleText(text: "Second")
//                .foregroundColor(.yellow)
//        }
        
//        Text("Hello World") // (10)
////            .modifier(Title()) // <- Using an extension lets you do the following instead:
//            .titleStyle()
        
//        Color.blue // (10)
//            .frame(width: 300, height: 300)
//            .watermarked(with: "Hacking with Swift")
        
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
