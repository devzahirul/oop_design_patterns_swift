import UIKit

//A simple example of Template method design pattern@.
class Pokemon {
    var name: String!
    var power: Int!
    var attack: Int!
    var defense: Int!
    
    init() {
        self.name = "UnKnown"
        self.power = 1
        self.attack = 1
        self.defense = 1
    }
    
    func calculateMultiplier()-> Int {
        return (2) * (self.power * 2)
    }
    
    func calculateImpact(multiplier: Int) -> Int {
        return 1
    }
    
    func showDanamge(damage: Int) {
        print("Pokemon damage is : \(damage)")
    }
    
    func calculateDamange() {
        let multiplier = calculateMultiplier()
        let damange = calculateImpact(multiplier: multiplier)
        showDanamge(damage: damange)
    }
}


class FightPokemon: Pokemon {
    override init() {
        super.init()
    }
    
    override func calculateImpact(multiplier: Int) -> Int {
        return multiplier*5
    }
}

class PoisonPokemon: Pokemon {
    override init() {
        super.init()
    }
    
    override func calculateImpact(multiplier: Int) -> Int {
        return multiplier*4
    }
}

class GroundPokemon: Pokemon {
    override init() {
        super.init()
    }
    
    override func calculateImpact(multiplier: Int) -> Int {
        return multiplier*3
    }
}


let fightPokemon = FightPokemon.init()
fightPokemon.calculateDamange()


let poisonPokemon = PoisonPokemon.init()
poisonPokemon.calculateDamange()


let groundPokemon = GroundPokemon.init()
groundPokemon.calculateDamange()


//Output
/**
 Pokemon damage is : 20
 Pokemon damage is : 16
 Pokemon damage is : 12
 */
