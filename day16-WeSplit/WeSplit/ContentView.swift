//
//  ContentView.swift
//  WeSplit
//
//  Created by Michael Knepprath on 7/24/20.
//

// MARK: 1. WeSplit: Introduction
// MARK: 2. Understanding the basic structure of a SwiftUI app
// Everything is Views!
// Opt+Cmd+P to resume previews.

// MARK: 3. Creating a form
// You can create a form by wrapping Text with Form.
// More than 10 items in a Form requires groups.
// Group doesn't change the visual appearance. If you do want to change the appearance, use Section instead.

// MARK: 4. Adding a navigation bar
// Swift helps us keep content in the "safe area". This means avoiding the notch, etc.
// Use a modifier to add a title.

// MARK: 5. Modifying program state
// "Views are a function of their state."
// SwiftUI gives us Property Wrappers so we can mutate data used in our View struct.
// Add "private" since they are stored in one View only.

// MARK: 6. Binding state to user interface controls
// @State doesn't work because we need the input to reflect state to reflect input. Two-way binding.

// MARK: 7. Creating views in a loop
// ForEach

import SwiftUI

struct ContentView: View {
//    @State private var tapCount = 0 // <- Property wrapper @State (there are more) (5)
    
//    @State private var name = "" // (6)
    
    let students = ["Harry", "Hermoine", "Ron"] // <- Doesn't need @State, because it's a constant. (7)
    @State private var selectedStudent = "Harry"
    
    var body: some View { // <- Views require a computed property, body. (2)
//        NavigationView { // (4)
//            Form { // (3)
//                Section {
//                    Text("Hello, world!").padding()
//                }
//                Section {
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                    Text("Hello, world!").padding()
//                }
//            }
//            .navigationBarTitle("SwiftUI") // <- Shortcut, because large titles are most common. (4)
//            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
//        }
        
//        Button("Tap count \(tapCount)") { (5)
//            self.tapCount += 1
//        }
                
//        Form {
//            TextField("Enter your name", text: $name) // <- Two-way binding (6)
//            Text("You're name is \(name)") // <- Not two-way binding (6)
//        }
        
//        Form {
//            ForEach(0..<100) { // (7)
//                Text("Row \($0)")
//            }
//        }
        
        Picker("Select your student", selection: $selectedStudent) { // <- Label for screen readers.
            ForEach(0..<students.count) {
                Text(self.students[$0]) // (7)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider { // <- Used specifically by Xcode to render previews. (2)
    static var previews: some View {
        ContentView()
    }
}

