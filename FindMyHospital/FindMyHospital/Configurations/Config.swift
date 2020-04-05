//
//  Config.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 05/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class Config: NSObject {
    fileprivate var config: Config?
    var data = [String: String]()
    
    // MARK: - Init
    
    class var shared : Config {
        struct Static {
            static let instance : Config = Config()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        
        if let path = Bundle(for: type(of: self)).path(forResource: "Config", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: String] {
            data = dict
        } else {
            print("Error: Config.plist is missing.")
        }
    }
}
