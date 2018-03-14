//
//  UIFont+Extensions.swift
//  MediApp
//
//  Created by Dominika Czarnecka on 15.11.2017.
//  Copyright © 2017 DominikaCzarnecka. All rights reserved.
//

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
        
        return UIFont(name: fontName, size: fontSize)
        
    }

}
