//
//  EmergencyHospViewController.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 03/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class EmergencyHospViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var emrHospTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    func setUpUI() {
        navigationItem.title = "Emergency Hospital" // load static string from R file
        emrHospTableView.tableFooterView = UIView()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.emergencyHospTableViewCell, for: indexPath)!
        return cell
    }
}
