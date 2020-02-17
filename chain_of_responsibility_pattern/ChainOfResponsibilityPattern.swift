import UIKit

//A simple example of Chain of Responsibility pattern

enum LogLevel: Int {
    case None
    case Info
    case Debug
    case Warning
    case Error
    case FunctionMessage
    case FunctionError
    case All
}

 class Logger {
    var logMask: LogLevel!
    
    var nextLogger: Logger!
    
    init(mask: LogLevel) {
        self.logMask = mask
    }
    
    func next(logger: Logger)-> Logger {
        var lastLogger = self
        while lastLogger.nextLogger != nil {
            lastLogger = lastLogger.nextLogger
        }
        
        lastLogger.nextLogger = logger
        
        return self
    }
    
    func message(msg: String,logLevel: LogLevel) {
        if self.logMask == logLevel {
            write(message: msg)
        }
        
        if nextLogger != nil {
            nextLogger.message(msg: msg, logLevel: logLevel)
        }
    }
    
    //override in subclass
    func write(message: String){}
}


final class ConsoleLogger: Logger {
    override init(mask: LogLevel) {
        super.init(mask: mask)
    }
    
    override func write(message: String) {
        print("Writing to console: \(message)")
    }
}


final class EmailLogger: Logger {
    override init(mask: LogLevel) {
        super.init(mask: mask)
    }
    
    override func write(message: String) {
        print("sending via email: \(message)")
    }
}


final class FileLogger: Logger {
    override init(mask: LogLevel) {
        super.init(mask: mask)
    }
    
    override func write(message: String) {
        print("Writing to log file: \(message)")
    }
}

var logger = ConsoleLogger.init(mask: .All)

logger.next(logger: EmailLogger.init(mask: .FunctionError))
    .next(logger: FileLogger.init(mask: .Warning))

logger.message(msg: "Any error", logLevel: .All)
logger.message(msg: "Functional Error", logLevel: .FunctionError)
logger.message(msg: "Warning ..", logLevel: .Warning)


//Output:
/*
 Writing to console: Any error
 sending via email: Functional Error
 Writing to log file: Warning ..
 */
