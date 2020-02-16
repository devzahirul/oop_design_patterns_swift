  
import UIKit

//A simple example of Module pattern
final class InputStream {
    var filePath: String
    init() {
        self.filePath = ""
    }
    
    func addFile(path: String) {
        self.filePath = path
    }
    
    func scanNextLine() -> String {
        return "scaned next line from \(filePath)"
    }
}

final class OutputStream {
    var filePath: String
    
    init() {
        self.filePath = ""
    }
    
    func addFile(path: String) {
        self.filePath = path
    }
    
    func saveOutput(output: String) {
        print("Save output into \(filePath)")
    }
}

final class ConsoleModule {
    static let shared = ConsoleModule.init()
    
    private var input: InputStream!
    private var output: OutputStream!
    
    private var outputStr: String!
    
    func prepare() {
        input = InputStream.init()
        output = OutputStream.init()
        outputStr = ""
    }
    
    func unprepare() {
        printString(value: "unprepare called")
        self.input = nil
        self.output = nil
    }
    
    func printNewLine() {
        print("\n")
    }
    
    func printString(value: String) {
        outputStr += value
        print(value)
    }
    
    func printInteger(value: Int64) {
        print(value)
    }
    
    func printBoolean(value: Bool) {
        print(value)
    }
    
    func scanNextLine() {
        if input.filePath.isEmpty {
            printString(value: "Please add a filePath")
            return
        }
        printString(value:input.scanNextLine())
    }
    
    func addScanFile(path: String) {
        input.addFile(path: path)
    }
    
    func addOutputSave(path:String) {
        output.addFile(path: path)
    }
    
    func saveOutput() {
        if output.filePath.isEmpty {
            print("Please add a output save path")
            return
        }
        
        output.saveOutput(output: outputStr ?? "")
    }
}


let console = ConsoleModule.shared

console.prepare()
console.printString(value: "This is a test text")
console.addScanFile(path: "scan.txt") //added a scan url
console.scanNextLine() // scan from scan.txt file
console.saveOutput() // faild to save output. cause output file path doesn't add
console.addOutputSave(path: "output.txt") // add output save path
console.saveOutput() // Now console output will save into output.txt file
console.unprepare() // remove console
//Output
/*
 This is a test text
 scaned next line from scan.txt
 Please add a output save path
 Save output into output.txt
 */
