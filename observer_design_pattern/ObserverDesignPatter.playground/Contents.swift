import UIKit

//A simple example of Observer design pattern

protocol Observer {
    func update(event: String)
}

class EventSource {
    var observers = [Observer]()
    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func notifyObservers(event: String) {
        for observer in observers {
            observer.update(event: event)
        }
    }
    
}

class Observer1: Observer {
    func update(event: String) {
        print("Event at Observer1 \(event)")
    }
}

class Observer2: Observer {
    func update(event: String) {
        print("Event at Observer2 \(event)")
    }
}

class Observer3: Observer {
    func update(event: String) {
        print("Event at Observer3 \(event)")
    }
}



let eventSource = EventSource.init()
eventSource.addObserver(observer: Observer1.init())
eventSource.addObserver(observer: Observer2.init())
eventSource.addObserver(observer: Observer3.init())


eventSource.notifyObservers(event: "Test update event")

//Output
/**
 Event at Observer1 Test update event
 Event at Observer2 Test update event
 Event at Observer3 Test update event
 */
