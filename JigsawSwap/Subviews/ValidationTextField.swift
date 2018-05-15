import UIKit
import RxSwift
import RxCocoa

class ValidationTextField: UITextField {

    let errorMessage: String?
    let defaultString: String?
    let validationRegex: String

    init(_ textFieldType: ValidationRegex, defaultString: String? = nil) {
        self.errorMessage = textFieldType.errorMessage()
        self.defaultString = defaultString
        self.validationRegex = textFieldType.validationRegex()
        super.init(frame: .zero)
        self.placeholder = textFieldType.placeholder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func validate() -> Bool {
        
        if let text = self.text, text.validate(with: validationRegex) {
            showErrorMessage(false)
            return true
        }
        showErrorMessage(true)
        return false
    }

    func showErrorMessage(_ shouldShow: Bool) {
        if shouldShow {
            layer.borderColor = UIColor.red.cgColor
            
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint.init(x: center.x - 10, y: center.y))
            animation.toValue = NSValue(cgPoint: CGPoint.init(x: center.x + 10, y: center.y))
            layer.add(animation, forKey: "position")
        } else {
            layer.borderColor = UIColor.clear.cgColor
        }
    }
}
