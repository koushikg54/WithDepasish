//
//  DrProfileTableViewController.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 04/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class DrProfileTableViewController: BaseTableViewController {

    @IBOutlet var drProfileTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpString()
       
    }
    func setUpString(){
        navigationItem.title = "Doctor Profile" // load static string from R file
        drProfileTableView.tableFooterView = UIView()
    }


}
