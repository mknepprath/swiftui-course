//
//  ContentView.swift
//  iExpense
//
//  Created by Michael Knepprath on 8/14/20.
//

import SwiftUI

//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

struct SecondView: View {
    var name: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Hello, \(name)!")
        
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
//    @ObservedObject var user = User()
    
//    @State private var showingSheet = false
    
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName).")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
        
//        Button("Show Sheet") {
//            self.showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "@mknepprath")
//        }
        
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("\($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
////                .listStyle(PlainListStyle())
//
//                Button("Add Number") {
//                    self.numbers.append(self.currentNumber)
//                    self.currentNumber += 1
//                }
//            }
//            .navigationBarItems(leading: EditButton())
//        }
        
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
    
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
