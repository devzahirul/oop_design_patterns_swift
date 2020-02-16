import UIKit

//A simple example of Flyweight pattern

final class CoffeeFlavour: Hashable {
    static func == (lhs: CoffeeFlavour, rhs: CoffeeFlavour) -> Bool {
        return lhs.flavour == rhs.flavour
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(flavour)
    }
    
    var flavour: String
    
    init(flavour: String) {
        self.flavour = flavour
    }
}

protocol ICoffeeFlavourFactory {
    func getFlavour(flavour: String, result: @escaping (CoffeeFlavour) -> Void)
}

final class ReduceMemoryFootprint: ICoffeeFlavourFactory {
    
   
    private var _cache = [String: CoffeeFlavour]()
    
    private let queue = DispatchQueue.init(label: "queueforflavourcache",
                                           qos: .userInteractive)
    
    func getFlavour(flavour: String,result: @escaping (CoffeeFlavour) -> Void) {
        queue.async {[unowned self] in
            
            
           // print("Before \(flavour) : \(self._cache[flavour])")
            
            if let cacheFlavour = self._cache[flavour] {
                print("return from cache")
                result(cacheFlavour)
            } else {
                let newFlavour = CoffeeFlavour.init(flavour: flavour)
                self._cache[flavour] = newFlavour
                print("Created new")
                result(newFlavour)
            }
            
        }
    }
}


let flavourStore = ReduceMemoryFootprint.init()

//let flavour1 = flavourStore.getFlavour(flavour: "Flavour_type_1")

DispatchQueue.global().async {
    flavourStore.getFlavour(flavour: "Flavour_type_2",result: { coffee in
        //printcoffee.flavour
    })
}

DispatchQueue.global().async {
    flavourStore.getFlavour(flavour: "Flavour_type_1",result: {coffee in
        
    })
}

DispatchQueue.global().async {
    flavourStore.getFlavour(flavour: "Flavour_type_2"){coffee in
        
    }
}

DispatchQueue.global().async {
    flavourStore.getFlavour(flavour: "Flavour_type_1",result: {coffee in
        
    })
}


//Output:
/*
 Created new
 Created new
 return from cache
 return from cache
 */

