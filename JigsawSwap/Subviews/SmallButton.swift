import UIKit

final class SmallButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            tintColor = isHighlighted ? .lightPink : .mainGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .mainGray
        titleLabel?.font = UIFont().appFont(fontSize: UIFont.FontSize.smallButton)
        configureConstraints()
    }
    
    private func configureConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            heightAnchor.constraint(equalToConstant: 30),
            widthAnchor.constraint(equalTo: heightAnchor)
            ])
    }
    
    @available(*, unavailable, message: "Please use init(frame: CGRect) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
