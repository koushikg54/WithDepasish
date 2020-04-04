//
//  Extension+UIViewController.swift
//  WOVO
//
//  Created by Debasish Mondal on 14/06/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
            addChild(child)
            if let frame = frame {
            child.view.frame = frame
        }
            self.view.addSubview(child.view)
        child.didMove(toParent: self)
        
    }
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
        
    }
    
    
}
