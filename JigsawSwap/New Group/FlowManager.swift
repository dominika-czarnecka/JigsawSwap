
import UIKit
import IQKeyboardManager
import KeychainAccess
import Firebase

/// Class for manage active controllers and configure flow elements
class FlowManager {
    
    /// Singleton instance of _FlowManager_
    static public let shared = FlowManager()
    
    /// Main navigation controller in application. Base of _FlowManager_.
    //TODO: Use LoginViewController
    private lazy var navigationController = UINavigationController(rootViewController: UIViewController())
    private lazy var tabBarController = UITabBarController()
    private lazy var boardNavigationController = UINavigationController()
    //TODO: Change for ProfileViewController
    private lazy var profileViewController = UIViewController()
    //TODO: Is NavigationController really needed?
    private lazy var jigsawNavigationController = UINavigationController()
    private lazy var tradesNavigationController = UINavigationController()
    
    /// _FlowManager_ constructor
    private init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    public func loadInitialController() {
        loadFirstController()
    }
    
    public func loadMainController() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        
        let profileBarItem = UITabBarItem(title: "FlowManager.TabBar.Profile".localized, image: #imageLiteral(resourceName: "TabBarProfil"), tag: 1)
        profileViewController.tabBarItem = profileBarItem
        
        let boardBarItem = UITabBarItem(title: "FlowManager.TabBar.Board".localized, image: #imageLiteral(resourceName: "TabBarSearch"), tag: 2)
        boardNavigationController.tabBarItem = boardBarItem
        
        let jigsawBarItem = UITabBarItem(title: "FlowManager.TabBar.jigsaw".localized, image: #imageLiteral(resourceName: "TabBarJigsaw"), tag: 3)
        jigsawNavigationController.tabBarItem = jigsawBarItem
        
        let tradesBarItem = UITabBarItem(title: "FlowManager.TabBar.treats".localized, image: #imageLiteral(resourceName: "TabBarExchange"), tag: 4)
        tradesNavigationController.tabBarItem = tradesBarItem
        
        //TODO: add controlers
        boardNavigationController.setViewControllers([UIViewController()], animated: true)
        jigsawNavigationController.setViewControllers([UIViewController()], animated: true)
        tradesNavigationController.setViewControllers([UIViewController()], animated: true)
        
        setupNavigationController(boardNavigationController, translucent: false)
        setupNavigationController(jigsawNavigationController, translucent: false)
        setupNavigationController(tradesNavigationController, translucent: false)
        
        tabBarController.tabBar.backgroundColor = .mainGray
        tabBarController.tabBar.unselectedItemTintColor = .white
        tabBarController.tabBar.tintColor = .mainPink
        tabBarController.viewControllers = [profileViewController, boardNavigationController, jigsawNavigationController, tradesNavigationController]
        
        appDelegate.window?.rootViewController = tabBarController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    private func loadFirstController(animated: Bool = false) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        
//        if let _ = Auth.auth().currentUser {
            loadMainController()
//        } else {
//            setupNavigationController(navigationController, translucent: false)
//            appDelegate.window?.rootViewController = navigationController
//            appDelegate.window?.makeKeyAndVisible()
//        }
        
    }
    
    func logout() {
        
        //TODO: Logout form Firebase
        
        setupNavigationController(navigationController, translucent: false)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        appDelegate.window?.rootViewController = navigationController
    }
    
    public func present(controller: UIViewController, animated: Bool = false) {
        navigationController.setViewControllers([controller], animated: animated)
    }
    
    private func setupNavigationController(_ navigationController: UINavigationController, translucent: Bool = false){
        
        navigationController.navigationBar.barTintColor = .mainGray
        navigationController.navigationBar.isTranslucent = translucent
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.shadowImage = UIImage()
        
    }
    
}
