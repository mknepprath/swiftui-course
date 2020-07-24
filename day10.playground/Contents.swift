import UIKit

// 1. Creating your own classes
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

// 2. Class inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

// 3. Overriding methods
class Cat {
    func makeNoise() {
        print("Meow!")
    }
}

class Siamese: Cat {
    override func makeNoise() {
        print("Yeowl!")
    }
}

let kitty = Siamese()
kitty.makeNoise()

// 4. Final classes
final class Horse {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// 5. Copying objects
// - class
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)

// - struct
struct Finger {
    var name = "Pointer"
}

var finger = Finger()
print(finger.name)

var fingerCopy = finger
fingerCopy.name = "Ring"
print(finger.name)

// 6. Deinitializers
class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// 7. Mutability
class Entertainer {
    var name = "Taylor Swift" // let to prevent mutability
}

let taylor = Entertainer()
taylor.name = "Ed Sheeran"
print(taylor.name)

// 8. Summary
