//
//  WebServiceManager.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 05/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class WebServiceManager {
    static private var _isRefreshing = false
    static private var _queue: [APIRequest] = [APIRequest]()
    
    
    // MARK: - Helpers
    
    class private func _host() -> String
    {
        return Config.shared.data["app.host"]! + "/api"
    }
    class private func _login() -> String {
        return  Config.shared.data["app.host"]!
        
    }
    
    class private func
        _headers(_ withAuth: Bool) -> HTTPHeaders
    {
        let hs: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        return hs
    }
    
    
    class private func _headersURLEncoded(_ withAuth: Bool) -> HTTPHeaders
    {
        let hs: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        return hs
    }
    
    class private func _dynamicHeader(_ authToken: String) -> HTTPHeaders {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(authToken)",
            "accept": "text/plain;v=1.0"
        ]
        return headers
    }
    
    class private func _runQueue()
    {
        _queue.forEach { self._run($0) }
        _queue.removeAll()
    }
    class private func _run(_ request: APIRequest)
    {
        if(self._isRefreshing)
        {
            _queue.append(request)
            return
        }
        
       
        Alamofire.request(self._host() + request.path, method: request.method,parameters: request.parameters).responseJSON { response in
            
            let statusCode = response.response?.statusCode
            // Unauthenticated
            if(statusCode == 401)
            {
                _queue.append(request)
                // try to refresh token
                if(!self._isRefreshing)
                {
                    self._refresh()
                }
            } else {
                self._handle(response, request.success, request.failure)
            }
        }
    }
    
    class private func _runForUrlEncoded(_ request: APIRequest)
    {
        if(self._isRefreshing)
        {
            _queue.append(request)
            return
        }
        
        Alamofire.request(self._login() + request.path, method: request.method, parameters: request.parameters, encoding: URLEncoding.default, headers: self._headersURLEncoded(true)).responseJSON { response in
            
            let statusCode = response.response?.statusCode
            // Unauthenticated
            if(statusCode == 401)
            {
                _queue.append(request)
                // try to refresh token
                if(!self._isRefreshing)
                {
                    self._refresh()
                }
            } else {
                self._handle(response, request.success, request.failure)
            }
        }
    }
    
    class private func _handle(_ response: DataResponse<Any>, _ success: (_ data: NSDictionary) -> Void, _ failure: (_ code: Int, _ errors: [String]) -> Void)
    {
        print("Request: \(String(describing: response.request))")   // original url request
        print("Response: \(String(describing: response.response))") // http url response
        
        if let info = response.data, let utf8Text = String(data: info, encoding: .utf8) {
            print("Data: \(utf8Text)") // original server data as UTF8 string
        }
        
        let statusCode = response.response?.statusCode
        
        var data = NSDictionary()
        var arrayData = Array<Any>()
        
        if let result = response.result.value {
            if result is Array<Any> {
                arrayData = result as! Array
                if arrayData.count != 0 {
                    for i in 0...arrayData.count - 1{
                        data = arrayData.first as! NSDictionary
                    }
                }
                
            }else if JSONSerialization.isValidJSONObject(result) {
                if !(result  is NSNull) {
                    print("wfqsdfasd",result)
                    data = result as! NSDictionary
                }
                else {
//                    Toast.show(withText:WOVOHelper.helper.resource?.timeOutErrorTxt ?? R.string.localizable.somethingWentWrong(), position: .top)
                }
            } else if result is Bool {
                
                if let info = response.data, let utf8Text = String(data: info, encoding: .utf8) {
                    data = ["validation":utf8Text]
                }
                
                
            }
        }
        
        if(statusCode == 200)
        {
            success(data)
        } else {
            var errors = [String]()
            if(data["errors"] != nil)
            {
                // array
                if data["errors"] is [String]
                {
                    errors = data["errors"] as! [String]
                    // or dictionary
                } else {
                    for(_,errs) in data["errors"] as! NSDictionary
                    {
                        for err in errs as! [String]
                        {
                            errors.append(err)
                        }
                    }
                }
            }
            failure(statusCode ?? 500, errors)
        }
    }
    
    // MARK: - Methods
    
    class private func _refresh()
    {
        self._refresh(nil)
    }
    
    class private func _refresh(_ success: (() -> Void)?)
    {
        self._isRefreshing = true
        
        let path = "/refresh"
        
        Alamofire.request(self._host() + path, method: .get, headers: self._headers(true)).responseJSON { response in
            
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            
            if let info = response.data, let utf8Text = String(data: info, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
            
            self._isRefreshing = false
            
            let statusCode = response.response?.statusCode
            // token refresh has failed
            if statusCode == 401 {
                // empty queue
                _queue.removeAll()
                // do complete logout
                
                
            } else {
                var data = NSDictionary()
                if let result = response.result.value {
                    data = result as! NSDictionary
                }
                // update model info
                
                // save as current model
                
                if(success != nil)
                {
                    success!()
                } else {
                    self._runQueue()
                }
            }
        }
    }
    
    // For CreateContact/UpdateContact  api  Alternative call With NSURLSession
    class func post(params : Dictionary<String, Any>, url : String, _ success: @escaping (_ data: NSDictionary) -> Void, _ failure: @escaping (_ code: Int, _ errors: [String]) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: url) as! URL)
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            print("Response: \(String(describing: response))")
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("Body: \(String(describing: strData))")
            
            var err: NSError?
            let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? NSDictionary
            
            let responseApi = response as? HTTPURLResponse
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil || responseApi?.statusCode != 200) {
                // print(err!.localizedDescription)
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("Error could not parse JSON: '\(String(describing: jsonStr))'")
                failure(responseApi?.statusCode ?? 500, [String(describing: jsonStr ?? "")])
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    success(parseJSON)
                    print("dictionary",parseJSON)
                    //                    let success = parseJSON!["success"] as? Int
                    let response = parseJSON["responseStatus"]
                   // print("CreateContactsApiResponseStatus",response!)
                }
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("Error could not parse JSON: \(String(describing: jsonStr))")
                }
            }
        })
        
        task.resume()
    }
    
    class func GetOTP( _ success: @escaping (_ data: NSDictionary) -> Void, _ failure: @escaping (_ code: Int, _ errors: [String]) -> Void)
    {
        let path = Config.shared.data["getOTP"]!
        let params: Parameters = [
            "mobile" : "8892517541",
            "plateform": "Android",            
            ]
        let request = APIRequest(path, .post, params, false, success, failure)
        self._run(request)
    }
    
    class func GetOTPWithNSURLSession(_ success: @escaping (_ data: NSDictionary) -> Void, _ failure: @escaping (_ code: Int, _ errors: [String]) -> Void)
    {
        let path = Config.shared.data["getOTP"]!
        let params: Parameters = [
            "mobile" : "8892517541",
            "plateform": "Android",
        ]
        post(params: params, url: self._host() + path, success, failure)
        
    }
    
}
