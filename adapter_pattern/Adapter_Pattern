import UIKit

//A simple example of Adapter design pattern in Swift
protocol ReadableString {
    func from(data: [String:Any]) -> String?
}

protocol ReadFormatable {
    func getReadableString(data:[String:Any]) -> String?
}

final class XMLReadFormater: ReadFormatable {
    func getReadableString(data: [String : Any]) -> String? {
        return converXML(data: data)
    }
    
    private func converXML(data:[String:Any])-> String {
        var xmlString = ""
        for (key,val) in data {
            xmlString += "<\(key)>"
            xmlString += "\(val)"
            xmlString += "</\(key)>"
        }
        
        return xmlString
    }
}

final class JSONReadFormater: ReadFormatable {
    func getReadableString(data: [String : Any]) -> String? {
     return converJSON(data: data)
    }
    
    private func converJSON(data:[String:Any]) -> String {
        var jsonString = "{"
        
        for (key,val) in data {
            jsonString += "\"\(key)\":"
            jsonString += "\"\(val),"
        }
        jsonString += "}"
        return jsonString
    }
}

final class ReadableStringAdapter: ReadableString {
    
    private var readformatable: ReadFormatable!
    
    init(readformatable: ReadFormatable) {
        self.readformatable = readformatable
    }
    
    
    func from(data:[String:Any]) -> String? {
        return readformatable.getReadableString(data: data)
    }
}



final class ReadableStringProvider {
    private var readableStringAdapter: ReadableString!
    
    init(formater: ReadFormatable) {
        self.readableStringAdapter = ReadableStringAdapter.init(readformatable: formater)
    }
    
    func getReadableString() -> ReadableString {
        return self.readableStringAdapter
    }
}


let xmlprovider = ReadableStringProvider.init(formater: XMLReadFormater.init())
let jsonprovider = ReadableStringProvider.init(formater: JSONReadFormater.init())

xmlprovider.getReadableString().from(data: ["title":"This is text","id":"123","subtitle":"This is subtitle"])
jsonprovider.getReadableString().from(data: ["title":"This is text","id":"123","subtitle":"This is subtitle"])
