
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
