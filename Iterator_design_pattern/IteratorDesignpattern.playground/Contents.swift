import UIKit

//A simple example of Iterator design pattern

protocol Iterable {
     func createIterator() -> Iterator
}

protocol Iterator {
    func hasNext() -> Bool
    func next() -> Int
}


class ArrayIterator: Iterator {
    var arr = [1,2,3,4,5,6,7,9,8,10]
   
    var startIndex = -1;
    
    func hasNext() -> Bool {
        startIndex = startIndex + 1
        return startIndex < arr.count
       
    }
    
    func next() -> Int {
        return arr[startIndex]
    }
}


class IntegerArray: Iterable {
    func createIterator() -> Iterator {
        return ArrayIterator.init()
    }
}


let integerIterator = IntegerArray.init().createIterator()

while integerIterator.hasNext() {
    print (integerIterator.next())
}

//Output
/**
 1
 2
 3
 4
 5
 6
 7
 9
 8
 10
 */
