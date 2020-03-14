import UIKit

//This is an example of Abstract Factory design pattern.
//Abstract Factory is a Creational design pattern.
//@More at https://en.wikipedia.org/wiki/Abstract_factory_pattern
/*
 In this example, we want to create a Button based on Windon & OSX Factory.
 We have a button protocol & button Factory protocol.
 ButtonProvider will take a buttonFactory as argument.
 */

//A button type
protocol Button {
    func paint()
}

//A Button Factory type
protocol ButtonFactory {
    func createButton() -> Button
}

//A windows button
final class WindowsButton: Button {
 
    func paint() {
        print("This is windows button")
    }
}

//A OSX button
final class OSXButton: Button {
 
    func paint() {
        print("This is a OSX button")
    }
}

//WindoButton Factory which will return a Window Type Button
final class WindowsButtonFactory: ButtonFactory {
 
    func createButton() -> Button {
        return WindowsButton.init()
    }
}


//OSXButton Factory which will return a OSX Type Button
final class OSXButtonFactory: ButtonFactory {
 
    func createButton() -> Button {
        return OSXButton.init()
    }
}

//
final class ButtonProvider {
 
    static func of(buttonFactory: ButtonFactory) -> Button {
        return buttonFactory.createButton()
    }
}

let winbutton = ButtonProvider.of(buttonFactory: WindowsButtonFactory.init())
print(winbutton.paint()) //Output: This is a windows button

let osxbutton = ButtonProvider.of(buttonFactory: OSXButtonFactory.init())
print(osxbutton.paint()) //Output: This is a OSX button
