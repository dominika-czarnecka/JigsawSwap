import Foundation
import UIKit

final class LoginOrRegisterViewController: ContainerViewController {
    let complectionOnSucceed: (() -> Void)?
    private var childContollerIndex: Int = 0
    
    private lazy var loginViewController: LoginViewController = {
        let loginVC = LoginViewController(self.complectionOnSucceed)
        return loginVC
    }()
    
    private lazy var registerViewController: RegisterViewController = {
        let registerVC = RegisterViewController(self.complectionOnSucceed)
        return registerVC
    }()
    
    init(_ complectionOnSucceed: (() -> Void)?, open atIndex: Int) {
        self.complectionOnSucceed = complectionOnSucceed
        super.init()
        childContollerIndex = atIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.add(asChild: [loginViewController, registerViewController])
        customView.scrollView.contentOffset.x += customView.frame.width * CGFloat(childContollerIndex)
    }
    
}
