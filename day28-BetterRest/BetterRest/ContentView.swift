//
//  ContentView.swift
//  BetterRest
//
//  Created by Michael Knepprath on 8/5/20.
//

import SwiftUI

// MARK: 1. Building a basic layout
// Added a bunch of headlines & steppers. Roughed them in at first.

// MARK: 2. Connecting SwiftUI to Core ML
// Rename the class based on the file name of mlmodel by renaming the file.

// MARK: 3. Cleaning up the user interface
// Nested each Text/View pairing in a VStack.

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var sleepTimeDisplay: String {
        let model = SleepCalculator() // <- Model, that was trained.
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short

            return formatter.string(from: sleepTime)
        } catch {
            return "Invalid Time"
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
    //                    .datePickerStyle(WheelDatePickerStyle()) // <- Nah. The new date component is nice.
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake")) {
//                    Stepper(value: $coffeeAmount, in: 1...20) {
//                        if coffeeAmount == 1 {
//                            Text("1 cup")
//                        } else {
//                            Text("\(coffeeAmount) cups")
//                        }
//                    }
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1 ..< 21) {
                            Text("\($0)")
                        }
                    }
                    .labelsHidden()
                }
                
                Section(header: Text("Ideal sleep time")) {
                    Text("\(sleepTimeDisplay)")
                        .font(.largeTitle)
                }
            }
            .navigationBarTitle("BetterRest")
//            .navigationBarItems(trailing:
//                                    Button(action: calculateBedtime) {
//                                        Text("Calculate")
//                                    }
//            )
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//            }
        }
    }
    
    static var defaultWakeTime: Date { // <- Better default time for users.
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
//    func calculateBedtime() {
//        let model = SleepCalculator() // <- Model, that was trained.
//
//        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//        let hour = (components.hour ?? 0) * 60 * 60
//        let minute = (components.minute ?? 0) * 60
//
//        do {
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
//
//            let sleepTime = wakeUp - prediction.actualSleep
//
//            let formatter = DateFormatter()
//            formatter.timeStyle = .short
//
//            alertMessage = formatter.string(from: sleepTime)
//            alertTitle = "Your ideal bedtime is…"
//        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bedtime."
//        }
//
//        showingAlert = true
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
