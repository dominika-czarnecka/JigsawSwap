import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func isValid(with regex: String) -> Bool {
        do {
            let regularExpression = try NSRegularExpression(pattern: regex, options: [])
            return (regularExpression.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil)
        } catch {
            print("Cannot created regular expression", error.localizedDescription)
            return false
        }
    }
}
