import UIKit

// MARK: Properties
struct Person {
    var clothes: String
    var shoes: String

    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

taylor.describe()
other.describe()

// Observed properties: willSet/didSet
struct Human {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var swift = Human(clothes: "T-shirts")
swift.clothes = "hat"

// Computed properties
struct Being {
    var age: Int
    
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
}

var fan = Being(age: 25)
print(fan.ageInDogYears)

// MARK: Static properties and methods
// Static properties = shared properties
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}

let stan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)

// MARK: Access control
// Don't need to specify this most of the time, but:
// Public: this means everyone can read and write the property.
// Internal: this means only your Swift code can read and write the property. If you ship your code as a framework for others to use, they won’t be able to read the property.
// File Private: this means that only Swift code in the same file as the type can read and write the property.
// Private: this is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.

class TaylorStan {
    fileprivate var name: String? // <- Used VERY rarely.
}

// MARK: Polymorphism and typecasting
// Because of inheritance, a class can be a superset of another class - and can therefore be treated as both classes.
class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studio")
var fearless = StudioAlbum(name: "Fearless", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]
// Works, they're all Album due to polymorphism.

for album in allAlbums {
    print(album.getPerformance())
    
    // print(album.studio) <- Would not work, since that's not on Album. Need to typecast.
    
    // Typecasting
    for album in allAlbums {
        if let studioAlbum = album as? StudioAlbum {
            print(studioAlbum.studio)
        } else if let liveAlbum = album as? LiveAlbum {
            print(liveAlbum.location)
        }
    }
}

var studioAlbums: [Album] = [taylorSwift, fearless]

for album in studioAlbums {
    print(album.getPerformance())
    
    let studioAlbum = album as! StudioAlbum // <- Force downcast. Have to be correct - CRASH!
    print(studioAlbum.studio)
}

// Try to downcast all albums as LiveAlbum, otherwise return empty array (do nothing):
for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.getPerformance())
    print(album.location)
}

// Can't typecast if unrelated. Like this:
// let number = 5
// let text = number as! String

let number = 5
let text = String(number)
print(text)
// This works for certain types. Not all.

// MARK: Closures
// You never need to design your own closures, but good to know how they work.
let vw = UIView()

// Most basic UI component:
UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

// UIKit takes a copy of the code in the braces (the closure), stores it away, does a bunch of prep, then runs the code.
// Captures its env. See `vw` above.

// SUGAR (trailing closure):
UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
