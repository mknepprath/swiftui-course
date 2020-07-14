import UIKit

// 1. Writing functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()

// 2. Accepting parameters
print("Hello, world!")

func square(number: Int){
    print(number * number)
}

square(number: 8)

// 3. Returning values
func square2(number: Int) -> Int {
    return number * number
}

let result2 = square2(number: 8)
print(result2)

// 4. Parameter labels
func square3(number: Int) -> Int {
    return number * number
}

let result3 = square3(number: 8)

func sayHello(to name: String) {
    print("Hello, \(name)!")
}
sayHello(to: "Taylor")

// 5. Omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Taylor")

// 6. Default parameters
func greet2(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet2("Taylor")
greet2("Taylor", nicely: false)

// 7. Variadic functions
print("Haters", "gonna", "hate")

func square3(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square3(numbers: 1, 2, 3, 4, 5)

// 8. Writing throwing functions
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

// 9. Running throwing functions
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// 10. inout parameters
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
