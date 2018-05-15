import UIKit
import RxSwift
import RxCocoa

class BaseViewController<TView: UIView> : UIViewController {

    internal let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var aView: TView {
        get { return self.view as! TView }
        set { self.aView = newValue }
    }
    
    override func loadView() {
        let view = TView(frame: UIScreen.main.bounds)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {}
    
}
