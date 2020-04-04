//
//  DeviceInfo.swift
//  WOVO
//
//  Created by Debasish Mondal on 01/08/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration.CaptiveNetwork
import CoreLocation


class DeviceInfo {
    static let sharedInstance = DeviceInfo()
    
    func getOS() -> String {
        return WovoConstant.value_ios
    }
    
    func getOSVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getDeviceModel() -> String {
        return UIDevice.current.model
    }
    func getTimeZone() -> String {
    let dateformater = DateFormatter()
    dateformater.locale = NSLocale.current
    dateformater.dateFormat = "MMM d"
        var timeZone = dateformater.timeZone.identifier
        if timeZone == "Asia/Kolkata"{
            timeZone = "asia/Calcutta"
        }
        return timeZone
    }
    
    
    func getDeviceDefaultLanguage() -> String {
       // return Locale.current.identifier
        return Locale.preferredLanguages.first! as String
    }
    
}
