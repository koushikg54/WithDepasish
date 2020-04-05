//
//  APIRequest.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 05/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import Foundation
import Alamofire

struct APIRequest
{
    let path: String
    let method: HTTPMethod
    let parameters: Parameters?
    let autheticate: Bool
    let success: (_ data: NSDictionary) -> Void
    let failure: (_ code: Int, _ errors: [String]) -> Void
    
    init(_ path: String, _ method: HTTPMethod, _ parameters: Parameters?, _ autheticate: Bool, _ success: @escaping (_ data: NSDictionary) -> Void, _ failure: @escaping (_ code: Int, _ errors: [String]) -> Void)
    {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.autheticate = autheticate
        self.success = success
        self.failure = failure
    }
}
struct APIRequestArray
{
    let path: String
    let method: HTTPMethod
    let parameters: Parameters?
    let autheticate: Bool
    let success: (_ data: Any) -> Void
    let failure: (_ code: Int, _ errors: [String]) -> Void
    
    init(_ path: String, _ method: HTTPMethod, _ parameters: Parameters?, _ autheticate: Bool, _ success: @escaping (_ data: Any) -> Void, _ failure: @escaping (_ code: Int, _ errors: [String]) -> Void)
    {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.autheticate = autheticate
        self.success = success
        self.failure = failure
    }
}
