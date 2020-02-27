import UIKit

// A simple example of Mediator Design pattern


protocol Perticipant {
    func receive(from: Perticipant, message: String)
    func send(message: String)
}

protocol ChatRoom {
    func register(perticipant: Perticipant)
    func send(from: Perticipant, message: String)
}


class iOSDevChatRoom: ChatRoom {
    
    var perticipants = [Perticipant]()
    
    func register(perticipant: Perticipant) {
        perticipants.append(perticipant)
    }
    
    func send(from: Perticipant, message: String) {
        for perticipant in perticipants {
            perticipant.receive(from: from, message: message)
        }
    }
}


class Dev1: Perticipant {
    var chatroom: ChatRoom!
    var devName: String = "Dev1"
    init(chatroom: ChatRoom) {
        self.chatroom = chatroom
    }
    
    func receive(from: Perticipant, message: String) {
        print("Message : \(message)")
    }
    
    func send(message: String) {
        chatroom.send(from: self, message: message)
    }
}


class Dev2: Perticipant {
    var chatroom: ChatRoom!
    var devName: String = "Dev2"
    init(chatroom: ChatRoom) {
        self.chatroom = chatroom
    }
    
    func receive(from: Perticipant, message: String) {
        print("Message : \(message)")
    }
    
    func send(message: String) {
        chatroom.send(from: self, message: message)
    }
}

class Dev3: Perticipant {
    var chatroom: ChatRoom!
    var devName: String = "Dev3"
    init(chatroom: ChatRoom) {
        self.chatroom = chatroom
    }
    
    func receive(from: Perticipant, message: String) {
        print("Message : \(message)")
    }
    
    func send(message: String) {
        chatroom.send(from: self, message: message)
    }
}


let devChatRoom = iOSDevChatRoom.init()

let dev1 = Dev1.init(chatroom: devChatRoom)
let dev2 = Dev2.init(chatroom: devChatRoom)
let dev3 = Dev3.init(chatroom: devChatRoom)

devChatRoom.register(perticipant: dev1)
devChatRoom.register(perticipant: dev2)
devChatRoom.register(perticipant: dev3)

dev1.send(message: "Hi ")

//Output
/**
 Message : Hi
 Message : Hi
 Message : Hi
 */
