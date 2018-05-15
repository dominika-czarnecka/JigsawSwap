import UIKit

class BaseView: UIView {

    func configureSubviews() {
        backgroundColor = .white
    }
    
    func configureConstraints() {}

    init() {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
