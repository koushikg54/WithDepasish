//
//  EnterOTPViewController.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 01/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class EnterOTPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func verifyBtnAction(_ sender: UIButton) {
        let dashBoard = R.storyboard.dashboard.swRevealViewController()!
        show(dashBoard,sender: self)
    }
    
   

}
