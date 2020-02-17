import UIKit

//A simpel example of Command design pattern

protocol ICommand {
    func execute()
}

protocol ISwitchable {
    func open()
    func close()
}

final class Light: ISwitchable {
    func open() {
        print("Light is on")
    }
    
    func close() {
        print("Light is Off")
    }
}

final class CommandOpenSwitch: ICommand {
    
    var iswitchable: ISwitchable!
    
    init(iswitchable: ISwitchable){
        self.iswitchable = iswitchable
    }
    
    func execute() {
        self.iswitchable.open()
    }
    
}


final class CommandCloseSwitch: ICommand {
    
    var iswitchable: ISwitchable!
    
    init(iswitchable: ISwitchable){
        self.iswitchable = iswitchable
    }
    
    func execute() {
        self.iswitchable.close()
    }
}

final class Swicth {
    var openCommand: ICommand!
    var closeCommand: ICommand!
    
    init(_ openCommand: ICommand, closeCommand: ICommand) {
        self.openCommand = openCommand
        self.closeCommand = closeCommand
    }
    
    func close(){
        self.closeCommand.execute()
    }
    
    func open() {
        self.openCommand.execute()
    }
}


let lampLight = Light.init()

let closeCommand = CommandCloseSwitch.init(iswitchable: lampLight)
let openCommand = CommandOpenSwitch.init(iswitchable: lampLight)

let lampSwitch = Swicth.init(openCommand, closeCommand: closeCommand)

lampSwitch.open()
lampSwitch.close()

//Output
/*
 Light is on
 Light is Off

 */
