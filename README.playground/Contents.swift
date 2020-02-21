import UIKit


protocol Expr {
    func interpret(context: [String: Int]) -> Int
    static func number(number: Int) -> Expr
    static func plus(left: Expr, right: Expr) -> Expr
    static func minus(left: Expr, right: Expr) -> Expr
    static func variable(name: String) -> Expr
}

extension Expr {
    
}


func parseToken(token: String, stack:[Expr]) -> Expr {
    var left: Expr;
    var right: Expr;
    
    switch token {
    case "+":
        <#code#>
    default:
        <#code#>
    }
}
