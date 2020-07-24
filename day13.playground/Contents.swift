import UIKit

// MARK: Variables and constants
var name = "Tim McGraw" // Value is initialized.
name = "Romeo" // Value can vary, be mutated.

let pi = 3.14 // Value is constant.
// Attempting to change this value will throw an error. You can't change a constant.

// Value and constant names must be unique in your code.

// MARK: Types of Data
var lastName = "Swift"
// "A string of characters." They can be long, short, or have no characters.

// Swift can tell what type this variable is based on the assigned value. If you don't assign a value, you have to use type annotations.
var firstName: String
firstName = "Taylor"

// Another type, Int, represents whole numbers only.
var age: Int
age = 25

// Coding convention (a.k.a. Swift doesn't care, but developers do): Variables are lowercased, while types are capitalized.

// name = 25
// age = "Time McGraw"

// This throws errors, you can't switch a variables type.

// Double: Swift's way of storing a fractional value.
// There are two types for storing this type of value, but Double is recommended in most cases. It has greater accuracy.
var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333 // You can see in the results panel that the last 3 is dropped.
// Float stores the "most important part" first. Making the number greater would drop more on the right.

// Bool, short for boolean, represents true/false.
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false // This is preferrable, as it's clearer - rather than using type annotation.
// This is type inference - Swift can tell what type of variable you want based on the value assigned.
// When provided a fractional value, Swift always assumes Double over Float.

// MARK: Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10
b *= 10

var c = 1.1
var d = 2.2
var e = c + d

var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

// There's also %, which divides and returns the remainder.

c > 3
c >= 3
c > 4
c < 4

// == for comparison, not =
name == "Romeo"
name != "Romeo"

stayOutTooLate
!stayOutTooLate // NOT

// MARK: String interpolation
"Your name is \(name)"
name = "Tim McGraw"
"Your name is " + name // <- Not recommended.

// String interpolation is smarter about using different types of values.
"Your name is \(name), your age is \(age), and your latitude is \(latitude)."

// You can do mathematics in the parens.
"Your age is \(age) years old. In another \(age) years you will be \(age * 2)."

// MARK: Arrays
var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
// Swift inferences the types of these arrays.

songs[0]
songs[1]
songs[2]
// songs[3] <- This would cause a crash.

type(of: songs)

var tracks: [String] = ["Shake it Off", "You Belong with Me", "Back to December"]
var tracklist: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3] // <- Any lets us add any type of value to an array, but this is generally not recommended.

// var songs: [String] <- This will not work, because it tells Swift what type of value will be stored in songs but does not create the array.
// songs[0] = "Shake it Off"
var moreSongs: [String] = []
var evenMoreSongs = [String]() // <- Parentheses creates the array.
// evenMoreSongs[0] = "Shake it Off" <- Won't work, since index 0 doesn't exist. Need to append.

var allSongs = songs + moreSongs + evenMoreSongs

// MARK: Dictionaries

// Arrays are accessed using the numeric index values. Dictionaries let you use a key.
var personArray = ["Taylor", "Alison", "Swift", "December", "taylorswift.com"]
personArray[1]
personArray[3] // <- Hard to know which value represents what.

var personDict = [
    "first": "Taylor",
    "middle": "Alison",
    "last": "Swift",
    "month": "December",
    "website": "taylorswift.com"
]
personDict["middle"]
personDict["month"]

// The keys are typically strings.

// MARK: Conditional statements
var action: String
var person = "hater"

if person == "hater" {
    action = "hate"
} else if person == "player" {
    action = "play"
} else {
    action = "cruise"
}

// With &&, both have to be true to set the action. Swift uses short-circuit evaluation.
if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}

// MARK: Loops
print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")
// Use print() for debugging.
// Also this would be better as a loop.

for i in 1...10 { // <- range 1-10 including 1 and 10.
    print("\(i) x 10 is \(i * 10)")
}

var lyric = "Fakers gonna"
for _ in 1...5 { // <- Underscore when you don't need the value.
    lyric += " fake"
}
print(lyric)

// Half-open range operator: ..<
// Does not include final number.

for song in allSongs {
    print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count { // <- 0-3, people.count == 4
    print("\(people[i]) gonna \(actions[i])")
}

// Nested loops:
for i in 0..<people.count {
    var str = "\(people[i]) gonna"
    
    for _ in 1...5 {
        str += " \(actions[i])"
    }
    
    print(str)
}

// While loop:
var counter = 0

while true {
    print("Counter is now \(counter)")
    
    counter += 1
    
    if counter == 3 {
        break // <- Ends the while loop. Careful about causing an infinite loop.
    }
}

for song in allSongs {
    if song == "You Belong with Me" {
        continue // <- Stop execution of this loop and skip to next loop.
    }
    
    print("My favorite song is \(song)")
}

// MARK: Switch case

// Could be considered an advanced for of "if".

let liveAlbums = 2

// Switch cases must be exhaustive. Swift enforces it.
switch liveAlbums {
case 0:
    print("You're just starting out")
case 1:
    print("You just released iTunes Live From SoHo")
case 2:
    print("You just released Speak Now World Tour")
default:
    print("Have you done something new?")
}

// You can use the range operator:
switch liveAlbums {
case 0...1:
    print("You're just starting out")
case 2...3:
    print("You're a rising star!")
case 4...5:
    print("You're world famous!")
default:
    print("Have you done something new?")
}
