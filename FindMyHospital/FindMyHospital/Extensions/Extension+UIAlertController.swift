//
//  Extension+UIAlertController.swift
//  WOVO
//
//  Created by Esa Sengupta on 04/06/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import UIKit
import Foundation

let alertOK = "OK"
let alertCancel = "Cancel"
var selectedIndex = 0
var selection: ((Int)->())?

extension UIAlertController {
    
    public class func showAlertWith(_ title: String, alertText: String,
                                    negativeTitle: String = "", positiveTitle: String = "",
                                    selected: @escaping (_ index: Int) -> Void) {
        let alert = UIAlertController(title: title, message: alertText, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: (negativeTitle == "" ? alertCancel : negativeTitle),
                                         style: .default) { (_) in
                                            selected(0)
        }
        alert.addAction(cancelAction)
        let doneAction = UIAlertAction(title: (positiveTitle == "" ? alertOK : positiveTitle), style: .default) { (_) in
            selected(1)
        }
        alert.addAction(doneAction)
        
        alert.view.tintColor = .appBlue
        UIAlertController.present(alertWith: alert)
    }
    
    public class func showNormalAlertWith(_ title: String, alertText: String,
                                          buttonTitle: String = "", selected: @escaping (_ index: Int) -> Void) {
        let alert = UIAlertController(title: title, message: alertText, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: (buttonTitle == "" ? alertOK : buttonTitle), style: .default) { (_) in
            selected(0)
        }
        alert.addAction(doneAction)
        
        alert.view.tintColor = .appBlue
        UIAlertController.present(alertWith: alert)
    }
    
    public class func showStandardActionSheetOrPopOverWith(_ title: String, messageText: String,
                                                           shouldShowAsPopOver: (sourceView: UIView, sourceRect: CGRect)? = nil,
                                                           buttonTitles: [String],
                                                           selectedIndex: @escaping (_ index: Int) -> Void) {
        let actionSheet = UIAlertController(title: title, message: messageText, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: alertCancel, style: .cancel) { _ in
        }
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        actionSheet.addAction(cancelAction)
        for (index, item) in buttonTitles.enumerated() {
            let buttonAction = UIAlertAction(title: item, style: .default, handler: { (_) in
                selectedIndex(index)
            })
            actionSheet.addAction(buttonAction)
        }
        if let popOver = shouldShowAsPopOver, isiPad() {
            actionSheet.popoverPresentationController?.sourceView = popOver.sourceView
            actionSheet.popoverPresentationController?.sourceRect = popOver.sourceRect
            actionSheet.popoverPresentationController?.permittedArrowDirections = .any
        }
        
        actionSheet.view.tintColor = .appBlue
        UIAlertController.present(alertWith: actionSheet)
    }
    
    private class func present(alertWith alert: UIAlertController) {
        if let window = keyWindow() {
            window.visibleViewController?.present(alert, animated: true, completion: nil)
        }
    }
}
