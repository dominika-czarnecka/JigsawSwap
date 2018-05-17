import UIKit

extension UIAlertController {
    convenience init(withOkAction: ((UIAlertAction) -> Void)?, title: String, message: String?) {
        self.init(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "Alert.Action.OK".localized, style: .default, handler: withOkAction)
        addAction(alertAction)
    }
}
