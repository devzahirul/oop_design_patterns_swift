import UIKit

//Simple implementation for Prototype pattern

protocol Prototype {
    var name: String {set get}
    func clone() -> Prototype
}

final class ConcretePrototypel: Prototype {
    var name: String = "ConcretePrototype1"
    
    func clone() -> Prototype {
        return ConcretePrototypel.init()
    }
}

final class ConcretePrototype2: Prototype {
    
    var name: String = "ConcretePrototype2"
    
    
    func clone() -> Prototype {
        return ConcretePrototype2.init()
    }
}

//Test
var prototype1 = ConcretePrototypel.init()
//Create 2 prototype
var prototype2 = prototype1.clone()
var prototype3 = prototype1.clone()

print(prototype2.name) //Output: ConcretePrototype1

prototype2.name = "ChangeBy2" //Change name of prototype2

print(prototype2.name) //Output: ChangeBy2

//not change the name of prototype3
print(prototype3.name) //Output: ConcretePrototype1
