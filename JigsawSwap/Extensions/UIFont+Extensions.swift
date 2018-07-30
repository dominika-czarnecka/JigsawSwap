import UIKit

extension UIFont {
    
    func appFont(bold: Bool = false, italic: Bool = false, fontSize: CGFloat) -> UIFont {
        var fontName = "NotoSans-"
        
        if !bold && !italic {
            fontName.append("Regular")
        } else {
            if bold { fontName.append("Bold") }
            if italic { fontName.append("Italic") }
        }
        
        return UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}


extension UIFont {
    struct FontSize {
        static let title: CGFloat = 50
        static let label: CGFloat = 20
        static let smallButton: CGFloat = 15
        static let normalButton: CGFloat = 20
    }
}
