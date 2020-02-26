import UIKit

protocol Expression {
    func interpret(stack: inout [Int])
}

class Number: Expression {
    var num: Int
    init(num: Int) {
        self.num = num
    }
    
    func interpret(stack: inout [Int]) {
        stack.append(num)
    }
}

class Plus: Expression {
    func interpret(stack: inout [Int]) {
        let n1 = stack.popLast()
        let n2 = stack.popLast()
        
        let re = (n1 ?? 0) + (n2 ?? 0)
        stack.append(re)
        
    }
}

class Minus: Expression {
    func interpret(stack: inout [Int]) {
        let n1 = stack.popLast()
        let n2 = stack.popLast()
              
        let re = (n1 ?? 0) - (n2 ?? 0)
        stack.append(re)
    }
}

class Parser {
    var parseTree = [Expression]()
    
    init(s: String) {
        for (_,c) in s.enumerated() {
            if c == "+" {
                parseTree.append(Plus.init())
                continue
            }
            
            if c == "-" {
                parseTree.append(Minus.init())
                continue
            }
           
            parseTree.append(Number.init(num: Int.init("\(c)") ?? 0))
           
        }
    }
    
    func evaluate()-> Int? {
        var stack = [Int]()
        
        for exp in parseTree {
            
            exp.interpret(stack: &stack)
        }
        
        return stack.popLast()
    }
    
}


let parser = Parser.init(s: "442-+")
print(parser.evaluate() ?? -1) //output: -2
