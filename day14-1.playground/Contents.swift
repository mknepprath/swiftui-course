import UIKit

// MARK: Functions
func favoriteAlbum() {
    print("My favorite is Fearless")
}

favoriteAlbum() // <- Calls the function.

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)

// Internal & external parameter names:
func countLettersInString(myString str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString(myString: "Hello")
// The external name can be an underscore, which would then allow you to call it like so:
// countLettersInString("Hello")

func countLetters(in str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLetters(in: "Hello") // <- "Swifty"

// Specify return type when returning:
func albumIsTaylors(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    return false
}

if albumIsTaylors(name: "Taylor Swift") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

if albumIsTaylors(name: "The White Album") {
    print("That's one of hers.")
} else {
    print("Who made that?")
}

// MARK: Optionals
func getHatersStatus(weather: String) -> String? { // <- That question mark means "Optional String".
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

// This won't run, because function may not return a String:
// var status: String
// status = getHatersStatus(weather: "rainy")

var status: String?
status = getHatersStatus(weather: "rainy")
// or use inference:
// var status = getHatersStatus(weather: "rainy")

// Unwrapping
// if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional string
// } else {
    // in case you want an else block, here you go...
// }

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHatersStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}

// Optional makes more sense here:
//func yearAlbumReleased(name: String) -> Int {
//    if name == "Taylor Swift" { return 2006 }
//    if name == "Fearless" { return 2008 }
//    return 0
//}

// Like this:
func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    return nil
}

var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int {
    for i in 0..<array.count {
        if array[i] == string {
            return i
        }
    }
    
    return 0 // <- Would be better to return nil.
}

let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)

// Force unwrapping
func yearAlbumWasReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    return nil
}

var year = yearAlbumWasReleased(name: "Taylor Swift")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)") // <- Without the !, this will still be optional
}

var name: String = "Paul"
var name2: String? = "Bob" // Must unwrap.
var name3: String! = "Sophie" // Let's you use the variable without Swift safety checks.

// MARK: Optional chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

let album = albumReleased(year: 2006)?.uppercased()
print("The album is \(album)")

let str = "Hello world"
print(str.uppercased())

let anotherAlbum = albumReleased(year: 2006) ?? "unknown"
print("The next album is \(anotherAlbum)")

// MARK: Enumerations
//enum WeatherType {
//    case sun, cloud, rain, wind, snow
//}

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getSadStatus(weather: WeatherType) -> String? {
//    if weather == .sun { // <- Lightning fast, don't need to write WeatherType.sun due to type inference
//        return nil
//    } else {
//        return "Sad"
//    }
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10: // <- Use let to get at the value in the enum.
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
    default:
        return "brrr"
    }
}

getSadStatus(weather: .cloud)

// MARK: Structs
// Complex data types made up of multiple values.
struct Person {
    var clothes: String
    var shoes: String
}

// Automatically includes a memberwise initializer.

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)

// You can place functions inside structs. Recommended, even!
struct Human {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

// MARK: Classes
// An instance of a class is called an object.

// Do not include memberwise initializers. There are 3 solutions.
// - Make the values into optionals - CLUMSY
// - Give them default values - WASTEFUL
// - Write your own initializer
class HumanBeing {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}
// All non-optional properties must have a property by the end of the initializer.

// Class inheritance
class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    @objc func sing() { // <- Xcode will tell you when it's needed.
        print("La la la la")
    }
}

class CountrySinger: Singer { // <- INHERITANCE
    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Grrrr rargh rargh rarrrrgh!")
    }
}

var swift = CountrySinger(name: "Taylor", age: 25)
swift.name
swift.age
swift.sing()
