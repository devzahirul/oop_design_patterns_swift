import UIKit


//A simple example of Proxy pattern
protocol Image {
    func displayImage()
}

final class ReadImage: Image {
    private var filename: String!
    
    init(filename: String) {
        self.filename = filename
        loadImageFromDisk()
    }
    
    func loadImageFromDisk() {
        print("Loading \(filename ?? "")")
    }
    
    func displayImage() {
        print("Displaying \(filename ?? "")")
    }
}


final class ProxyImage: Image {
    private var image: Image!
    private var filename: String!
    
    init(filename: String) {
        self.filename = filename
    }
    
    //Check is image nil
    //If nil create RealImage instance
    //Call display
    //else
    //Call display
    func displayImage() {
        if image == nil {
            image = ReadImage.init(filename: self.filename)
        }
        image.displayImage()
    }
}


let image1 = ProxyImage.init(filename: "photo1")
let image2 = ProxyImage.init(filename: "photo2")

image1.displayImage()
image1.displayImage()
image2.displayImage()
image1.displayImage()
image2.displayImage()
image1.displayImage()
image1.displayImage()
image2.displayImage()
image1.displayImage()
image2.displayImage()

//Output
/*
 Loading photo1
 Displaying photo1
 Displaying photo1
 Loading photo2
 Displaying photo2
 Displaying photo1
 Displaying photo2
 Displaying photo1
 Displaying photo1
 Displaying photo2
 Displaying photo1
 Displaying photo2
 */
