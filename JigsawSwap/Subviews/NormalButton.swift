import UIKit

final class NormalButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            tintColor = isHighlighted ? .lightPink : .mainGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = .mainGray
        backgroundColor = .mainPink
        titleLabel?.font = UIFont().appFont(fontSize: UIFont.FontSize.normalButton)
        layer.cornerRadius = CGFloat.LayoutDimensions.normalButtonHeight * 0.5
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            heightAnchor.constraint(equalToConstant: CGFloat.LayoutDimensions.normalButtonHeight),
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8)
        ])
    }
    
    @available(*, unavailable, message: "Please use init(frame: CGRect) instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
