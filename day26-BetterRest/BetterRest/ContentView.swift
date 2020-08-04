//
//  ContentView.swift
//  BetterRest
//
//  Created by Michael Knepprath on 8/3/20.
//

import SwiftUI

// MARK: 1. Entering numbers with Stepper
// Can work with any number type, it will adapt.
// The "%g" specifier removes insignificant 0s.

// MARK: 2. Selecting dates and times with DatePicker
// You can create date ranges quite easily!
// You can create one-sided ranges, like Date()..., from now into the future.
// displayedComponents lets you select what kind of date picker appears.
// .labelsHidden() hides the label but keeps the view accessible.

// MARK: 3. Working with dates
// It's hard! DST. Leap seconds. Etc. iOS can handle this all for us.
// DateComponents() is the solution!
// The lesson seems to be, don't try to manually work with dates. Probably true in all languages. But yeah.

// MARK: 4. Training a model with Create ML
// Core ML... also Create ML... and then a Create ML app.

struct ContentView: View {
//    @State private var sleepAmount = 8.0 // (1)
    
    @State private var wakeUp = Date() // (2)
    
    var body: some View {
//        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) { // (1)
//            Text("\(sleepAmount, specifier: "%g") hours")
//        }
        
//        let now = Date() // (2)
//        let tomorrow = Date().addingTimeInterval(86400) // <- Not true for all days. Dates are HARD.
//        let range = now...tomorrow
        
//        var components = DateComponents() // (3)
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date()
        
//        let formatter = DateFormatter() // (3)
//        formatter.timeStyle = .short
//        let dateString = formatter.string(from: Date())
        
        Form { // (2)
            DatePicker(
                "Please enter a date",
                selection: $wakeUp,
                displayedComponents: .hourAndMinute
            )
            .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
