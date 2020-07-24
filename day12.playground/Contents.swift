import UIKit

// 1. Handling missing data
var age: Int? = nil
age = 38

// 2. Unwrapping optionals
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name")
}

// 3. Unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    
    print("Hello, \(unwrapped)!")
}

// 4. Force unwrapping
let str = "5"
let num = Int(str)! // Force unwrapping a nil value will cause a CRASH

// 5. Implicitly unwrapping optionals
let age2: Int! = nil // Implicitly unwrapping a nil value will cause a CRASH

// 6. Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"

// 7. Optional chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()

// 8. Optional try
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit") // If the function throws an error, your code will crash.
print("OK!")

// 9. Failable initializers
let str2 = "5"
let num2 = Int(str2) // This is a failable initializer

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// 10. Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

// 11. Summary
