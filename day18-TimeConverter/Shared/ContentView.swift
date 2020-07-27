//
//  ContentView.swift
//  Shared
//
//  Created by Michael Knepprath on 7/27/20.
//

import SwiftUI

struct Unit: Hashable {
    var name: String
    var value: Double
}

struct ContentView: View {
    @State private var inputAmount = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let units = [
        Unit(name: "seconds", value: 1.0),
        Unit(name: "minutes", value: 60.0),
        Unit(name: "hours", value: 3600.0),
        Unit(name: "days", value: 86400.0)
    ]
    
    var convertedValue: Double {
        let amountInSeconds = units[inputUnit].value * (Double(inputAmount) ?? 0)
        let amountConverted = amountInSeconds / units[outputUnit].value
        return amountConverted
        }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $inputAmount) // <- First string is placeholder value. (1)
                    // Also this is a two-way binding, so changes are being watched.
                        .keyboardType(.decimalPad) // <- Tabbed bc it's one level deeper. Not required.
                    
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< self.units.count) {
                            Text("\(self.units[$0].name)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert to...")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< self.units.count) {
                            Text("\(self.units[$0].name)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(convertedValue, specifier: "%.10g")")
                }
            }
            .navigationTitle("Time Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
