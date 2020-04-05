//
//  ViewController.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 31/03/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController {

    @IBOutlet weak var mobileTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInAction(_ sender: UIButton) {
       // WebServiceManager.GetOTP(signInSuccess(_:), signInFailure(_:_:))
         WebServiceManager.GetOTPWithNSURLSession(signInSuccess(_:), signInFailure(_:_:))
    }
    
    func signInSuccess(_ data: Any) {
        print("MYdata",data)
        let otpVeriication = R.storyboard.main.enterOTPViewController()!
        show(otpVeriication, sender: self)
    }
    
    func signInFailure(_ status: Int, _ errors: [String])
    {
        print("Api failed to success")
    }
}

