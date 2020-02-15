import UIKit

//A simple example for Facade pattern
//In this example , when computer start call ,
//we want to call Cpu freeze, load application
//into Memory from Hard Drive
//


final class Cpu {
    func freeze() {
        print("Cpu freeze called")
    }
    
    func jump() {
         print("Cpu jump called")
    }
    
    func execute() {
         print("Cpu execute called")
    }
}

final class HardDrive {
    func read() {
        print("Read from hard drive")
    }
}

final class Memory {
    func load(){
        print("Load into Memory")
    }
}


final class ComputerFacade {
    var cpu: Cpu
    var memory: Memory
    var hardDrive: HardDrive
    
    init(cpu: Cpu,
         memory: Memory,
         hardDrive: HardDrive) {
        self.cpu = cpu
        self.hardDrive = hardDrive
        self.memory = memory
    }
    
    func start() {
        cpu.freeze()
        memory.load()
        cpu.execute()
    }
}


//Test

let computerFacade = ComputerFacade.init(cpu: Cpu.init(),
                                         memory: Memory.init(),
                                         hardDrive: HardDrive.init())
computerFacade.start()

//Output
/*
    Cpu freeze called
    Load into Memory
    Cpu execute called

*/
