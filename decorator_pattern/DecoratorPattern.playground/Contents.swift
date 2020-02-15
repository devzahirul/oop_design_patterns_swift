import UIKit


//A simple example for Decorator pattern
//wrap a object dynamically 


protocol WebPage {
    func display()
}

final class BasicWebPage: WebPage {
    func display() {
        print("Basic WEB page")
    }
}

class WebPageDecorator: WebPage {
    
    private var decoratedWebPage: WebPage
    init(webpage: WebPage) {
        self.decoratedWebPage = webpage
    }
    
    func display() {
        decoratedWebPage.display()
    }
    
}

final class AuthenticatedWebPage: WebPageDecorator {
    override init(webpage: WebPage) {
        super.init(webpage: webpage)
    }
    
    override func display() {
        if authenticateUser() == true {
            super.display()
        } else {
            print("Authenticate failed!")
        }
    }
    
    func authenticateUser()-> Bool {
        print("Authetication done")
        return true
    }
}

final class AuthorizedWebPage: WebPageDecorator {
    override init(webpage: WebPage) {
        super.init(webpage: webpage)
    }
    
    override func display() {
        if authorizedUser() == true {
            super.display()
        } else {
            print("Authorization failed!")
        }
    }
    
    func authorizedUser()-> Bool {
        print("Authorization done")
        return true
    }
}


//Test
let page = AuthenticatedWebPage.init(webpage: AuthorizedWebPage.init(webpage: BasicWebPage.init()))
page.display()

//Output

/*
 Authetication done
 Authorization done
 Basic WEB page
 */
