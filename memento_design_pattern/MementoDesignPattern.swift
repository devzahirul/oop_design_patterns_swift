import UIKit

//A simple example of Memento design pattern
class Memento {
    let state: String
    init(state: String) {
        self.state = state
    }
}


class Originator {
    var state: String!
    
    func set(state: String) {
        self.state = state
        print("Originator: Setting state to \(state)")
    }
    
    func saveToMemento()-> Memento {
        print("Originator: Saving to Memento.")
        return Memento.init(state: self.state)
    }
    
    func restoreFromMemento(memento: Memento) {
        self.state = memento.state
        print("Originator: State after restoring from Memento: \(state ?? "")")
    }
}

var savedStates = [Memento]()

var originator = Originator.init()
originator.set(state: "State1")
originator.set(state: "State2")
savedStates.append(originator.saveToMemento())
originator.set(state: "State3")
savedStates.append(originator.saveToMemento())
originator.set(state: "State4")

originator.restoreFromMemento(memento: savedStates[1])


//output
/**
 Originator: Setting state to State1
 Originator: Setting state to State2
 Originator: Saving to Memento.
 Originator: Setting state to State3
 Originator: Saving to Memento.
 Originator: Setting state to State4
 Originator: State after restoring from Memento: State3
 */
