//
//  Constants.swift
//  WOVO
//
//  Created by Esa Sengupta on 21/05/19.
//  Copyright © 2019 Indusnet Technologies. All rights reserved.
//

import UIKit
import Foundation

public let versionNumber = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
public let buildNumber = Bundle.main.infoDictionary!["CFBundleVersion"]!
public let systemVersion = UIDevice.current.systemVersion
public let screenWidth = UIScreen.main.bounds.width
public let screenHeight = UIScreen.main.bounds.height
public let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
public let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

public func cacheDirectoryPath(byAppendingPath path: String = "") -> String {
    let cache = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    let cacheWithPath = "\(cache)/\(path)"
    return cacheWithPath
}

public func documentsDirectoryPath(byAppendingPath path: String = "") -> String {
    let document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let documentPath = "\(document)/\(path)"
    return documentPath
}

public func isRetina() -> Bool {
    return (UIScreen.main.responds(to: #selector(UIScreen.displayLink(withTarget:selector:))) && UIScreen.main.scale >= 2.0)
}

public func isiPad() -> Bool {
    switch UIDevice.current.userInterfaceIdiom {
    case .phone: // It's an iPhone
        return false
    case .pad: // It's an iPad
        return true
    case .unspecified: // undefined
        return false
    default:
        return false
    }
}

public func radiansToDegrees(radians: CGFloat) -> CGFloat {
    return radians * 180 / CGFloat.pi
}

public func set(object obj: AnyObject, forKey key: String) {
    UserDefaults.standard.set(obj, forKey: key)
}

public func object(forKey key: String) -> AnyObject? {
    if UserDefaults.standard.object(forKey: key) != nil {
        return UserDefaults.standard.object(forKey: key)! as AnyObject?
    }
    return nil
}

public func set(integer integerValue: Int, forKey key: String) {
    UserDefaults.standard.set(integerValue, forKey: key)
}

public func integer(forKey key: String) -> Int {
    return UserDefaults.standard.integer(forKey: key)
}

public func set(float floatValue: Float, forKey key: String) {
    UserDefaults.standard.set(floatValue, forKey: key)
}

public func float(forKey key: String) -> Float {
    return UserDefaults.standard.float(forKey: key)
}

public func set(double doubleValue: Double, forKey key: String) {
    UserDefaults.standard.set(doubleValue, forKey: key)
}

public func double(forKey key: String) -> Double {
    return UserDefaults.standard.double(forKey: key)
}

public func set(bool boolValue: Bool, forKey key: String) {
    UserDefaults.standard.set(boolValue, forKey: key)
}

public func bool(forKey key: String) -> Bool {
    return UserDefaults.standard.bool(forKey: key)
}

public func removeObject(forKey key: String) {
    UserDefaults.standard.removeObject(forKey: key)
}

public func UIColorRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

public func firstWindow() -> UIWindow? {
    return UIApplication.shared.windows.first
}

public func keyWindow() -> UIWindow? {
    return UIApplication.shared.keyWindow
}

public func printLog<T>(_ object: @autoclosure () -> T) {
    #if DEBUG
    let value = object()
    print(String(reflecting: value))
    #endif
}

public func printDetailedLog<T>(_ object: @autoclosure () -> T, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
    let value = object()
    let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
    let queue = Thread.isMainThread ? "UI" : "BG"
    print("QUEUE: \(queue)\nFILE_NAME: \(fileURL)\nFUNCTION_NAME: \(function)\nLINE_NO: \(line)\nREFLECTING_VALUE: " + String(reflecting: value))
    #endif
}

