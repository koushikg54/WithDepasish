//
//  Extension+UITextField.swift
//  WOVO
//
//  Created by Esa Sengupta on 21/05/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import UIKit
import Foundation

extension UITextField {
    
//    func setError() {
//        let error = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        error.image = R.image.error()
//        self.rightView = error
//        self.rightViewMode = .always
//    }
//    
//    func setErrorForPassword() {
//        let error = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        error.image = R.image.error()
//        self.rightView = error
//        self.rightViewMode = .always
//    }
    
    func removeError() {
        self.rightViewMode = .never
    }
}

extension UITextField {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if (object(forKey: kAppLanguage) as? String) == "ur" {
            if textAlignment == .natural {
                self.textAlignment = .right
            }
        } else {
            self.textAlignment = .left
        }
    }
}
