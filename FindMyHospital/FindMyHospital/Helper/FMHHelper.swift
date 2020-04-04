//
//  FMHHelper.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 31/03/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit
import Reachability
import WebKit

class FMHHelper: NSObject {
    
    static let helper = FMHHelper()
    private override init() {}
    
    private var loaderView: UIView?
    private var clearView: UIView?
   
    var languageChanged = false
    var home = UINavigationController()
    
//    public func checkNetworkRecheablity() -> Bool{
//        let reachability = Reachability()!
//        if reachability.connection != .none {
//            if reachability.connection == .wifi {
//                print("Reachable via WiFi")
//                return true
//            } else {
//                print("Reachable via Cellular")
//                return true
//            }
//        } else {
//            print("Network not reachable")
//            return false
//        }
//    }
    func isRTL() -> Bool {
        var value = false
        if WovoConstant.LanguageENUS == "ur" {
            value = true
        }
        return value
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func showClearView() {
        if clearView == nil {
            DispatchQueue.main.async {
                self.clearView = UIView(frame: UIScreen.main.bounds)
                self.clearView?.backgroundColor = .clear
                UIApplication.shared.windows.first!.addSubview(self.clearView!)
            }
        }
    }
    
    func hideClearView() {
        if clearView != nil {
            DispatchQueue.main.async {
                self.clearView!.removeFromSuperview()
                self.clearView = nil
            }
        }
    }
    
    func showLoader() {
        if loaderView == nil {
            DispatchQueue.main.async {
                self.loaderView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
                self.loaderView?.layer.cornerRadius = 4.0
                self.loaderView?.backgroundColor = UIColorRGB(red: 0, green: 0, blue: 0, alpha: 0.8)
                self.loaderView?.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
                activityIndicator.color = .white
                activityIndicator.center = CGPoint(x: self.loaderView!.bounds.width / 2, y: self.loaderView!.bounds.height / 2)
                self.loaderView!.addSubview(activityIndicator)
                UIApplication.shared.windows.first!.addSubview(self.loaderView!)
                activityIndicator.startAnimating()
            }
        }
    }
    
    func hideLoader() {
        if loaderView != nil {
            loaderView!.removeFromSuperview()
            loaderView = nil
        }
    }
}


