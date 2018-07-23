
import UIKit
import IQKeyboardManager
import Firebase

class FlowManager {
    static public let shared = FlowManager()
    
     //TODO: add controlers
    private lazy var navigationController = UINavigationController(rootViewController: UIViewController())
    private lazy var tabBarController = UITabBarController()
    private lazy var wallNavigationController = UINavigationController(rootViewController: WallViewController())
    private lazy var profileViewController = UIViewController()
    private lazy var jigsawNavigationController = UINavigationController(rootViewController: UIViewController())
    private lazy var tradesNavigationController = UINavigationController(rootViewController: UIViewController())
    
    private init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    public func loadInitialController() {
        loadMainController()
    }
    
    public func loadMainController() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        
        let profileBarItem = UITabBarItem(title: "TabBar.Profile".localized, image: #imageLiteral(resourceName: "TabBarProfil"), tag: 1)
        profileViewController.tabBarItem = profileBarItem
        
        let wallBarItem = UITabBarItem(title: "TabBar.Board".localized, image: #imageLiteral(resourceName: "TabBarSearch"), tag: 2)
        wallNavigationController.tabBarItem = wallBarItem
        
        let jigsawBarItem = UITabBarItem(title: "TabBar.jigsaw".localized, image: #imageLiteral(resourceName: "TabBarJigsaw"), tag: 3)
        jigsawNavigationController.tabBarItem = jigsawBarItem
        
        let tradesBarItem = UITabBarItem(title: "TabBar.treats".localized, image: #imageLiteral(resourceName: "trade"), tag: 4)
        tradesNavigationController.tabBarItem = tradesBarItem
        
        setupNavigationBarAppearace()
        
        tabBarController.tabBar.backgroundColor = .mainGray
        tabBarController.tabBar.unselectedItemTintColor = .white
        tabBarController.tabBar.tintColor = .mainPink
        tabBarController.viewControllers = [profileViewController, wallNavigationController, jigsawNavigationController, tradesNavigationController]
        
        appDelegate.window?.rootViewController = tabBarController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    public func logout() {
        //TODO: Logout form Firebase
    }
    
    private func setupNavigationBarAppearace() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barTintColor = .mainGray
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.tintColor = .white
        navigationBarAppearace.barStyle = .black
        navigationBarAppearace.shadowImage = UIImage()
    }
}
