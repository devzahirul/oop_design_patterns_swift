import UIKit

//A simple example of servant design pattern
class Position {
    var xPosition: Float!;
    var yPosition: Float!;
    
    init(dx: Float,dy: Float) {
        self.xPosition = dx;
        self.yPosition = dy;
    }
}

protocol Movable {
    var position: Position! {set get}
}

class MoveServant {
    func moveTo(movable: inout Movable, position: Position) {
        movable.position = position
    }
    
    func moveBy(movable: inout Movable,dx: Float,dy: Float) {
        let currentPos = movable.position
        let newDx = currentPos?.xPosition ?? 0.0 + dx
        let newDy = currentPos?.yPosition ?? 0.0 + dy
        
        movable.position = Position.init(dx: newDx, dy: newDy)
    }
}

class Triange: Movable {
    var position: Position!
}

class Ellipse: Movable {
    var position: Position!
}

class Rectangle: Movable {
    var position: Position!
}


var tringle: Movable = Triange.init()
var ellipse: Movable = Ellipse.init()
var rectangle: Movable = Rectangle.init()

let movServant = MoveServant.init()

movServant.moveTo(movable: &tringle,
                  position: Position.init(dx: 12.0, dy: 13.0))

print("Triangle position: x: \(tringle.position.xPosition ?? 0.0) y: \(tringle.position.yPosition ?? 0.0)")


movServant.moveBy(movable: &ellipse, dx: 12.0, dy: 14.9)
print("Ellipse position: x: \(ellipse.position.xPosition ?? 0.0) y: \(ellipse.position.yPosition ?? 0.0)")


//Output
/**
 Triangle position: x: 12.0 y: 13.0
 Ellipse position: x: 12.0 y: 14.9
 */
