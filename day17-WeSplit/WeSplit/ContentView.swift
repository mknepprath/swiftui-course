//
//  ContentView.swift
//  WeSplit
//
//  Created by Michael Knepprath on 7/25/20.
//

// MARK: 1. Reading text from the user with TextField
// Specifying the keyboard type doesn't prevent bad inputs from external keyboards or copy/paste.

// MARK: 2. Creating pickers in a form
// Pickers also require two-way binding.
// Picker doesn't seem to work on its own, it needs a navigation view. Once this is added, things work as expected.

// MARK: 3. Adding a segmented control for tip percentages
// Use .pickerStyle() to choose the Picker style.

// MARK: 4. Calculating the total per person
// Add a computed property to figure out the total per person.
// When converting a string to a Double, the result is Double? (optional).
// "%f" = floating-point number
// "%g" = same thing, but removes insignificant numbers
// ".2" = two digits after decimal point
// So we want "%.2f" to display the total.

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = "" // <- User input must be text, therefore string. (1)
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2 // <- Index, so this represents 20. v
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // Calculate the total per person here. (4)
        let peopleCount = Double(numberOfPeople + 2) // <- Converting everything to double to calculate $$ accurately.
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount) // <- First string is placeholder value. (1)
                    // Also this is a two-way binding, so changes are being watched.
                        .keyboardType(.decimalPad) // <- Tabbed bc it's one level deeper. Not required.
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
//                    Text("How much tip do you want to leave?") <- Doesn't look great. Use as a section header. (3) ^
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit") // <- Needs to be attached to the thing inside the navigation view. Allows iOS to change titles freely. (2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
