import UIKit

//A simple example of Strategy design pattern
protocol IBillingStrategy {
    func calculateActPrice(rawPrice: Double) -> Double
}

class NormalStrategy: IBillingStrategy {
    func calculateActPrice(rawPrice: Double) -> Double {
        return rawPrice
    }
}

class HappyHourStrategy: IBillingStrategy {
    func calculateActPrice(rawPrice: Double) -> Double {
        return rawPrice * 0.5
    }
}


class Customer {
    var currentStrategy: IBillingStrategy!
    var drinks: [Double]!
    
    
    init(strategy: IBillingStrategy) {
        self.currentStrategy = strategy
        drinks = []
    }
    
    func add(price: Double, quantity: Int) {
        drinks.append(self.currentStrategy.calculateActPrice(rawPrice: price * Double(quantity)))
    }
    
    func printBill() {
        var sum: Double = 0.0
        
        for drinkPrice in drinks {
            sum = sum + drinkPrice
        }
        
        print("$Total due: \(sum).")
        drinks.removeAll()
    }
}


let normalStrategy = NormalStrategy.init()
let happyHourStrategy = HappyHourStrategy.init()

var firstCustomer = Customer.init(strategy: normalStrategy)

firstCustomer.add(price: 2.0, quantity: 1)
firstCustomer.add(price: 3.0, quantity: 2)

firstCustomer.printBill()

var newCustomer = Customer.init(strategy: happyHourStrategy)
newCustomer.add(price: 2.0, quantity: 3)
newCustomer.add(price: 5.0, quantity: 6)
newCustomer.add(price: 1.0, quantity: 3)

newCustomer.printBill()


//Output
/**
 $Total due: 8.0.
 $Total due: 19.5.
 */
