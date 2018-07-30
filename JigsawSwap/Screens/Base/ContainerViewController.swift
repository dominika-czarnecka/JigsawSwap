import UIKit

class ContainerViewController: BaseViewController<ContainerView> {
    
    internal func add(asChild viewControllers: [UIViewController]) {
        for (index, viewController) in viewControllers.enumerated() {
            addChildViewController(viewController)
            customView.scrollView.addSubview(viewController.view)
            
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            customView.addConstraints([
                viewController.view.topAnchor.constraint(equalTo: customView.scrollView.topAnchor),
                viewController.view.heightAnchor.constraint(equalTo: customView.scrollView.heightAnchor),
                viewController.view.widthAnchor.constraint(equalTo: customView.scrollView.widthAnchor),
                viewController.view.leftAnchor.constraint(equalTo: customView.scrollView.leftAnchor, constant: UIScreen.main.bounds.width * CGFloat(index))
            ])
            if index == viewControllers.count - 1 {
                customView.addConstraint(viewController.view.rightAnchor.constraint(equalTo: customView.scrollView.rightAnchor))
            }
            
            viewController.didMove(toParentViewController: self)
        }
    }
    
    internal func remove(asChild viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    
    override func setupReactiveBinding() { }
}
