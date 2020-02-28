  
import UIKit

//A simple example of Visitor design pattern
protocol LoggVisiotr {
    func visit(_ consoleLogg: ConsoleLogg)
    func visit(_ sendEmailLogg: SendEmailLogg)
    func visit(_ saveFileLogg: SaveFileLogg)
}


protocol LoggVisiable {
    func accept(_ logVisitor: LoggVisiotr)
}

class ConsoleLogg: LoggVisiable {
    func accept(_ logVisitor: LoggVisiotr) {
        logVisitor.visit(self)
    }
}

class SendEmailLogg: LoggVisiable {
    func accept(_ logVisitor: LoggVisiotr) {
        logVisitor.visit(self)
    }
}


class SaveFileLogg: LoggVisiable {
    func accept(_ logVisitor: LoggVisiotr) {
        logVisitor.visit(self)
    }
}


class LoggTestVisiotr: LoggVisiotr {
    func visit(_ consoleLogg: ConsoleLogg) {
        print("Write into console.")
    }
    
    func visit(_ saveFileLogg: SaveFileLogg) {
        print("Save into a file")
    }
    
    func visit(_ sendEmailLogg: SendEmailLogg) {
        print("Send email ...")
    }
}


var loggs = [LoggVisiable]()
loggs.append(ConsoleLogg.init())
loggs.append(SaveFileLogg.init())
loggs.append(SendEmailLogg.init())


var testVisitor = LoggTestVisiotr.init()

for logg in loggs {
    logg.accept(testVisitor)
}
//Output
/**
 Write into console.
 Save into a file
 Send email ...
 */
