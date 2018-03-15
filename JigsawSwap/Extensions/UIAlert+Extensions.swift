
import UIKit

extension UIAlertController {
    convenience init(withOkAction: Bool, title: String, message: String?) {
        self.init(title: title, message: message, preferredStyle: .alert)
        if withOkAction {
            let alertAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
            self.addAction(alertAction)
        }
    }
}
