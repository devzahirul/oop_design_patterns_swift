import UIKit

//A Simple implementation Bridge pattern
//

protocol AlertBridge {
    func showAlert(text: String)
}

final class AndroidAlert: AlertBridge {
    func showAlert(text: String) {
        print("\(text) in Android")
    }
}

final class iOSAlert: AlertBridge {
    func showAlert(text: String) {
        print("\(text) in iOS")
    }
}

protocol Alert {
    var alertBridge: AlertBridge? {set get}
    func showAlert(text: String)
}

class NativeAlert: Alert {
    var alertBridge: AlertBridge?
    
    init(alertBridge: AlertBridge) {
        self.alertBridge = alertBridge
    }
    
    func showAlert(text: String) {
        self.alertBridge?.showAlert(text: text)
    }
}


//Test

let alertAndroid = NativeAlert.init(alertBridge: AndroidAlert.init())
let alertiOS = NativeAlert.init(alertBridge: iOSAlert.init())

alertAndroid.showAlert(text: "Alert") //Output:Alert in Android
alertiOS.showAlert(text:"Alert") //Output: Alert in iOS
