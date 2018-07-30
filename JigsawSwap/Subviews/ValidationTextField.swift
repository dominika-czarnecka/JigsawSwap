import UIKit
import RxSwift
import RxCocoa

final class ValidationTextField: UITextField {
    let errorMessage: String?
    let defaultString: String?
    let validationRegex: String

    init(_ textFieldType: ValidationType, defaultString: String? = nil) {
        self.errorMessage = textFieldType.errorMessage
        self.defaultString = defaultString
        self.validationRegex = textFieldType.validationRegex
        super.init(frame: .zero)
        self.placeholder = textFieldType.placeholder
        
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            heightAnchor.constraint(equalToConstant: 50),
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.5)
        ])
    }
    
    @available(*, unavailable, message: "Please use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isValid() -> Bool {
       return text?.isValid(with: validationRegex) ?? false
    }

    func set(as valid: Bool) {
        valid ? animateIdentity() : animateError()
    }
    
    func animateError() {
        layer.borderColor = UIColor.red.cgColor
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint.init(x: center.x - 10, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint.init(x: center.x + 10, y: center.y))
        layer.add(animation, forKey: "position")
    }
    
    func animateIdentity() {
        layer.borderColor = UIColor.clear.cgColor
    }
}
