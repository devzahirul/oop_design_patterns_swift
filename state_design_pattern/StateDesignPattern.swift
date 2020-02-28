import UIKit


class StateContext {
    var state: State!
    
    init() {
        state = LowerCaseState.init()
    }
    
    func changeState(state: State) {
        self.state = state
    }
    
    func writeName(name: String) {
        state.writeName(self,name: name)
    }
}

protocol State {
    func writeName(_ context: StateContext, name: String)
}

class LowerCaseState: State {
    func writeName(_ context: StateContext, name: String) {
        print(name.lowercased())
    }
}

class UpperCaseState: State {
    func writeName(_ context: StateContext, name: String) {
        print(name.uppercased())
    }
}


let stateContext = StateContext.init()
stateContext.writeName(name: "MY NAME IS JOWEL")

stateContext.changeState(state: UpperCaseState.init())
stateContext.writeName(name: "My Name is jowel")

//Output
/**
 my name is jowel
 MY NAME IS JOWEL
 */
