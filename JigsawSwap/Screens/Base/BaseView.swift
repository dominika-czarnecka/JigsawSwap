import UIKit

class BaseView: UIView {
    
    internal func configureConstraints() {
        fatalError("You have to override this function")
    }

    init() {
        super.init(frame: .zero)
        configureConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    @available(*, unavailable, message: "Please use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
