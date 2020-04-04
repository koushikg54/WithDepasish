//
//  PhotoHandler.swift
//  WOVO
//
//  Created by Debasish Mondal on 04/09/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import Foundation
import UIKit

class PhotoHandler: NSObject {
     static let helper = PhotoHandler()
//    //MARK: - Open the camera
//    func openCamera(){
//        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
//            UIDatePicker.sourceType = UIImagePickerController.SourceType.camera
//            //If you dont want to edit the photo then you can set allowsEditing to false
//            UIDatePicker.allowsEditing = true
//            UIDatePicker.delegate = self
//            self.present(UIDatePicker, animated: true, completion: nil)
//        }
//        else{
//            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//
//    //MARK: - Choose image from camera roll
//
//    func openGallary(){
//        UIDatePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
//        //If you dont want to edit the photo then you can set allowsEditing to false
//        UIDatePicker.allowsEditing = true
//        UIDatePicker.delegate = self
//        self.present(UIDatePicker, animated: true, completion: nil)
//    }
}
