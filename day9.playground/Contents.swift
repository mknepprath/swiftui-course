import UIKit

// 1. Initializers
struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "mknepprath"

// 2. Referring to the current instance
struct Person {
    var name:String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// 3. Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree() // not created until accessed at least once
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")

// 4. Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed2 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
Student.classSize

// 5. Access control
struct Person3 {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed3 = Person3(id: "12345")
// ed3.id fails because id is private
ed3.identify()

// 6. Summary
