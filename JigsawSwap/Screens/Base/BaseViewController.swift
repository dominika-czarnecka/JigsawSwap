import UIKit
import RxSwift
import RxCocoa

class BaseViewController<TView: UIView> : UIViewController {

    internal let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "Please use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var customView: TView {
        get { return view as! TView }
    }
    
    override func loadView() {
        view = TView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReactiveBinding()
    }
    
    internal func setupReactiveBinding() {
        fatalError("You have to override this function")
    }
}
