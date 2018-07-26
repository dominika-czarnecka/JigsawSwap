import UIKit

class BaseView: UIView {
    
    internal func configureConstraints() {
        fatalError("You have to override this function")
    }

    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        backgroundColor = .lightGray
    }
    
    @available(*, unavailable, message: "Please use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
