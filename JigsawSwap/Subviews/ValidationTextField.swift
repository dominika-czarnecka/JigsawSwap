import UIKit
import RxSwift
import RxCocoa

final class ValidationTextField: UITextField {
    let errorMessage: String?
    let validationRegex: String
    //TODO: Think about defaultString
    init(_ textFieldType: ValidationType, defaultString: String? = nil) {
        errorMessage = textFieldType.errorMessage()
        validationRegex = textFieldType.validationRegex()
        super.init(frame: .zero)
//        if let defaultString = defaultString {
//            text = defaultString
//        }
        placeholder = textFieldType.placeholder()
        keyboardType = textFieldType.keyboardType()
        textColor = .mainPink
        autocorrectionType = .no
        backgroundColor = .white
        layer.cornerRadius = 5
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            heightAnchor.constraint(equalToConstant: 50),
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.8)
        ])
    }
    
    @available(*, unavailable, message: "Please use init() instead")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isValid() -> Bool {
        if let text = self.text, text.isValid(with: validationRegex) {
            dismissErrorMessage()
            return true
        }
        showErrorMessage()
        return false
    }

    func showErrorMessage() {
        layer.borderColor = UIColor.red.cgColor
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint.init(x: center.x - 10, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint.init(x: center.x + 10, y: center.y))
        layer.add(animation, forKey: "position")
    }
    
    func dismissErrorMessage() {
        layer.borderColor = UIColor.clear.cgColor
    }
}
