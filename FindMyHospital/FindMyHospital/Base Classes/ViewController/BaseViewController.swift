//
//  BaseViewController.swift
//  WOVO
//
//  Created by Debasish Mondal on 07/06/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var navigationBarShadowEnabled: Bool = false
    var shouldOverrideBack = true
    var alertEnabled = false
    var editEnabled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        navigationController?.navigationItem.backBarButtonItem = nil
        navigationItem.hidesBackButton = true        
        if FMHHelper.helper.isRTL(){
            let img =  R.image.back()!
            let newImage = UIImage(cgImage: img.cgImage!, scale: img.scale, orientation: UIImage.Orientation.down)
            navigationController?.navigationBar.backIndicatorImage = newImage
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = newImage
            navigationController?.view.semanticContentAttribute = .forceRightToLeft
            navigationController?.navigationBar.semanticContentAttribute =  .forceRightToLeft
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            
        } else {
            navigationController?.navigationBar.backIndicatorImage = R.image.back()
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = R.image.back()
            navigationController?.view.semanticContentAttribute = .unspecified
            navigationController?.navigationBar.semanticContentAttribute =  .unspecified
            UIView.appearance().semanticContentAttribute = .unspecified
        }


        setupBarButtonItems()
    }
    
    private func setupBarButtonItems() {
        if shouldOverrideBack {
            let transparentBack = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            transparentBack.backgroundColor = .clear
            let backButton = BaseButton(frame: transparentBack.bounds)
            backButton.contentMode = .topLeft
            if FMHHelper.helper.isRTL() {
                let img =  R.image.back()!
                let newImage = UIImage(cgImage: img.cgImage!, scale: img.scale, orientation: UIImage.Orientation.down)
                backButton.setImage(newImage, for: .normal)
            } else {
                backButton.setImage(R.image.back(), for: .normal)
            }
            backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            transparentBack.addSubview(backButton)
            let backItem = UIBarButtonItem(customView: transparentBack)
            navigationItem.leftBarButtonItem = backItem
            
        } else {
            //navigationController?.navigationBar.backIndicatorImage = R.image.back()
            //navigationController?.navigationBar.backIndicatorTransitionMaskImage = R.image.back()
        }
//        if alertEnabled {
//            let alertView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//            let alertButton = BaseButton(frame: alertView.bounds)
//            alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
//            if FMHHelper.helper.isRTL() {
//                let img =  R.image.emergency()!
//                let newImage = UIImage(cgImage: img.cgImage!, scale: img.scale, orientation: UIImage.Orientation.left)
//                alertButton.setImage(newImage, for: .normal)
//            } else {
//                alertButton.setImage(R.image.emergency(), for: .normal)
//            }
//            alertButton.setImage(R.image.emergency(), for: .normal)
//            alertView.addSubview(alertButton)
//            let alertItem = UIBarButtonItem(customView: alertView)
//            navigationItem.rightBarButtonItem = alertItem
//        }
//        if editEnabled {
//            let editView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 23))
//            let editButton = BaseButton(frame: editView.bounds)
//            editButton.addTarget(self, action: #selector(editAction), for: .touchUpInside)
//            if FMHHelper.helper.isRTL() {
//                let img =  R.image.edit()!
//                let newImage = UIImage(cgImage: img.cgImage!, scale: img.scale, orientation: UIImage.Orientation.down)
//                editButton.setImage(newImage, for: .normal)
//            } else {
//                 editButton.setImage(R.image.edit(), for: .normal)
//            }
//           
//            editView.addSubview(editButton)
//            let editItem = UIBarButtonItem(customView: editView)
//            navigationItem.rightBarButtonItem = editItem
//            
//        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .appNavBlue
        
        if navigationBarShadowEnabled {
            navigationController?.navigationBar.layer.masksToBounds = false
            navigationController?.navigationBar.layer.shadowColor = UIColor.appBorderGray.cgColor
            navigationController?.navigationBar.layer.shadowOpacity = 0.5
            navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            navigationController?.navigationBar.layer.shadowRadius = 4
        } else {
            navigationController?.navigationBar.layer.masksToBounds = true
        }
        //navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.backgroundColor = nil
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        if screenHeight <= 568 {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 17)!]
        }
        else {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 22)!]
        }
    }
    
    @objc public func backAction() {
        print("back")
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc public func alertAction() {
    }
    @objc public func editAction() {
        
    }
    
}
