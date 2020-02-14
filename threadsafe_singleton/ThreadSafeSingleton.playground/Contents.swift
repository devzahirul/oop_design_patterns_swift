import UIKit

//This is simple implementation of Singleton desing pattern
//AppInfo class is global
//AppInfo store remoteppushtoken,appname & appidentifier

//Singleton
//Catn't create instance from outside
//Can access Globally
final class AppInfo {
    static let shared = AppInfo.init()
    
    //For thread safe
    //Prevent to create multiple instance
    private let _internalqueue = DispatchQueue.init(label: "mysingleton",
                                                   qos: .default,
                                                   attributes: .concurrent)
    
    private var _appName: String!
    private var _appId: String!
    private var _remotePushToken: String!
    
    //Add default value
    private init() {
        print("Init called") //For checking is called multiple times
        _appName = ""
        _appId = ""
        _remotePushToken = ""
    }
    
    //Set & Get for appName
    public var appName: String {
        get {
            return _internalqueue.sync {
                _appName
            }
        }
        
        set(newAppName) {
            _internalqueue.async(flags: .barrier) {
                self._appName = newAppName
            }
        }
    }
    
    //Set & Get for appId
    public var appId: String {
          get {
              return _internalqueue.sync {
                  _appId
              }
          }
          
          set(newAppId) {
              _internalqueue.async(flags: .barrier) {
                  self._appId = newAppId
              }
          }
      }
    
    //Set & Get for remotePushToken
    public var remotePushToken: String {
             get {
                 return _internalqueue.sync {
                     _remotePushToken
                 }
             }
             
             set(newRemotePushToken) {
                 _internalqueue.async(flags: .barrier) {
                     self._remotePushToken = newRemotePushToken
                 }
             }
         }
}

//Test

//Call from Global thread
DispatchQueue.global().async {
    AppInfo.shared.appName = "MyiOSApp"
   
}

//Call from Worker thread
DispatchQueue.init(label: "WorkerQueue").async {
    AppInfo.shared.appId = "com.iosapp.myiosapp"
}

//Call from Main thread
DispatchQueue.main.async {
    print(AppInfo.shared.appName)
    print(AppInfo.shared.appId)
}

