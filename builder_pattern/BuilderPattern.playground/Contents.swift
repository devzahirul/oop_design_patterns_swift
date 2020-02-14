import UIKit

//This is simple implementation for Builder design pattern
//We are creating a Car class with 4 propertices
//Everytime when we want to create a Car Object , we need to pass 4 arguments into initilizer,
//which is difficult to add/remove arguments also.
//That's why we used a Builder Class for Car object creation sothat we can Add/Remove from one place and easy

//Car
final class Car {
    private var make: String
    private var model: String
    private var numberOfDoors: Int
    private var colour: String
    
    //Create with propertices
    init(make: String,
         model:String,
         numberOfDoors:Int,
         colour:String) {
        self.make = make
        self.model = model
        self.numberOfDoors = numberOfDoors
        self.colour = colour
    }
    
    //Print carinfo
    public func readCarInfo() {
        print("Make -> \(make), Model -> \(model), NumberOfDoors -> \(numberOfDoors), Colour -> \(colour)")
    }
}

//Car Builder protocol
protocol ICarBuilder {
    var make: String {set get}
    var model: String? {set get}
    var numberOfDoors: Int? {set get}
    var colour: String? {set get}
    
    func with(model: String) ->Self
    func with(numberOfDoors: Int) ->Self
    func with(colour: String) ->Self
    func build() -> Car
}

//Implement the ICarBuilder
final class FerrariBuilder: ICarBuilder {
    internal var numberOfDoors: Int?
    internal var colour: String?
    internal var model: String?
    internal var make: String
    
    //Create with make property
    //Set initial value for other propertices
    init(make: String) {
        self.make = make
        self.model = ""
        self.numberOfDoors = 0
        self.colour = ""
    }
    
    //Set model
    //Return Self object sothat we can call again other methods
    func with(model: String) -> Self {
        self.model = model
        return self
    }
    
    //Set numberOfDoors
    //Return Self object
    func with(numberOfDoors: Int) -> Self {
        self.numberOfDoors = numberOfDoors
        return self
    }
    
    //Set Colour
    //Return Self object
    func with(colour: String) -> Self {
        self.colour = colour
        return self
    }
    
    //Return Car object
    func build() -> Car {
        return Car.init(make: self.make,
                        model: self.model!,
                        numberOfDoors: self.numberOfDoors!,
                        colour: self.colour!)
    }
}

//Test
let car = FerrariBuilder.init(make: "Ferrari")
    .with(colour: "Red")
    .with(model: "488 Spider")
    .with(numberOfDoors: 2)
    .build()

//print carinfo
car.readCarInfo() //Output: Make -> Ferrari, Model -> 488 Spider, NumberOfDoors -> 2, Colour -> Red

