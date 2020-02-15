import UIKit

//A simple example of Composite design pattern
protocol FileComponent {
    func display()
}

final class File: FileComponent {
    private var name: String!
    
    init(name: String) {
        self.name = name
    }
    
    func display() {
        print("File Name: \(name ?? "")")
    }
}

final class Folder: FileComponent {
    private var name: String!
    private var componentList: [FileComponent]!
    
    init(name: String) {
        self.name = name
        self.componentList = [FileComponent]()
    }
    
    func display() {
        print("Folder Name: \(name ?? "")")
        for (_,fileComponent) in componentList.enumerated() {
            fileComponent.display()
        }
    }
    
    func add(fileComponent: FileComponent) {
        componentList.append(fileComponent)
    }
}


//Test
let folder1 = Folder.init(name: "New Folder 1")
let folder2 = Folder.init(name: "New Folder 2")

let file1 = File.init(name: "File 1")
let file2 = File.init(name: "File 2")
let file3 = File.init(name: "File 3")
let file4 = File.init(name: "File 4")
let file5 = File.init(name: "File 5")

let newfile1 = File.init(name: "New File 1")
let newfile2 = File.init(name: "New File 2")

folder1.add(fileComponent: file1)
folder1.add(fileComponent: file2)
folder1.add(fileComponent: file3)

folder2.add(fileComponent: file4)
folder2.add(fileComponent: file5)

folder1.display()
folder2.display()
newfile1.display()
newfile2.display()

//Output
/*
Folder Name: New Folder 1
File Name: File 1
File Name: File 2
File Name: File 3
Folder Name: New Folder 2
File Name: File 4
File Name: File 5
File Name: New File 1
File Name: New File 2
 */
