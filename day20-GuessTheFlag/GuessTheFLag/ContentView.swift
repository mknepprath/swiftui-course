//
//  ContentView.swift
//  GuessTheFLag
//
//  Created by Michael Knepprath on 7/28/20.
//

import SwiftUI

// MARK: 1. Guess the Flag: Introduction
// Stacks, buttons, images, alerts, asset catalogs, and more.

// MARK: 2. Using stacks to arrange views
// body can only contain one view within it, similar to how you must wrap child components with fragments.
// To return multiple things:
// - HStack: Horizontal layout
// - VStack: Vertical layout
// - ZStack: Depth layout (on top of each other)
// Views want to be centered. A Spacer can be used to bump them around.

// MARK: 3. Colors and frames
// SIMPLE AND POWERFUL.
// SwiftUI comes with a lot of colors, including some purpose-driven ones:
// Color.red <- available color
// Color.primary <- black or white depending on light or dark mode.
// Color(red: 1, green: 0.8, blue: 0) <- Custom colors.
// Color.red.edgesIgnoringSafeArea(.all) <- Extend outside "safe area".

// MARK: 4. Gradients
// Includes an array of colors, direction, type of gradient.
// LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
// RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
// AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)

// MARK: 5. Buttons and images
// Using the ".original" modifier on an icon will revert it to the expected color.


struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
                    self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
        
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
//        Button("Tap me!") { // <- Simple button
//            print("Button was tapped")
//        }
//        Button(action: { print("Buttn was tapped") }) {Text("Tap me!")} // <- More complex button
//        Button(action: {
//            print("Edit button was tapped")
//        }) {
//            Image(systemName: "pencil") // <-- With image
//            Text("Edit")
//        }
//        ZStack {
//            Color(red: 1, green: 0.8, blue: 0) // <- Can be used as its own view!
//            Text("Your content")
//        }
        // .background(Color.red) <- Applies it just to the text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
