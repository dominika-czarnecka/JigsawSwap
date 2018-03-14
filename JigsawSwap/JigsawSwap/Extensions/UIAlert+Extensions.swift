//
//  UIAlert+Extensions.swift
//  MediApp
//
//  Created by Dominika Czarnecka on 01.11.2017.
//  Copyright © 2017 DominikaCzarnecka. All rights reserved.
//

import UIKit

extension UIAlertController {

    static func createWithOKAction(title: String, message: String?) -> UIAlertController {
        
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default) { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
		return alert
		
    }
    
}
