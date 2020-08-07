//
//  ContentView.swift
//  WordScramble
//
//  Created by Michael Knepprath on 8/6/20.
//

import SwiftUI

// MARK: 1. Word Scramble: Introduction
//  List, onAppear(), Bundle, fatalError(), and more

// MARK: 2. Introducing List, your best friend
// It's a different table view style. Can mix static and dynamic views.
// Lists can generate its rows entirely from dynamic content with ForEach:
// List(0..<5) {
//    Text("Row \($0)")
// }
// To get unique identifier in List: \.self

// MARK: 3. Loading resources from your app bundle
// Can load data from other filetypes. The bundle is what is shipped; includes code, images, etc. The "main bundle" can contain files for an iOS app, extension, Watch app, etc.
// So we can grab files packaged in the bundle directly with Bundle.main.url()... returns optional, so it must be unwrapped.

// MARK: 4. Working with strings
// Swift can convert a single string into an array of strings.
// .components(separatedBy: " ") is essentially .split(" ") in JavaScript.
// UI- prefix implies it's a UIKit method, and is written with Objective-C.

struct ContentView: View {
//    let people = ["Finn", "Leia", "Luke", "Rey"] // (2)
    
    var body: some View {
//        List {
//            Section(header: Text("Section 1")) {
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//            Section(header: Text("Section 2")) {
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//
//            Section(header: Text("Section 3")) {
//                Text("Static row 3")
//            }
//        }
//        .listStyle(GroupedListStyle()) (2)
        
//        List(people, id: \.self) { // <- Also works with ForEach, to mix static & dynamic views like above. (2)
//            Text($0)
//        }
//        .listStyle(GroupedListStyle())
        
//        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
//            // we found the file in our bundle
//            if let fileContents = try?
//                String(contentsOf: fileURL) {
//                // we loaded the file into a string
//            }
//        } // (3)
        
//        let input = "a b c" // (4)
//        let letters = input.components(separatedBy: " ")
        
//        let input = """
//                    a
//                    b
//                    c
//                    """ // (4)
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift" // Swift does clever things to allow for emojis. UIKit does not support this, so we have to account for that. (4)
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en") // <- Tells us where the misspelling is. Objective-C doesn't have optionals, so we get back NSNotFound. NSNotFound in this case means NO misspellings. So it's what we want!
        let allGood = misspelledRange.location == NSNotFound

        
        return Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
