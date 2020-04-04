//
//  DataSources.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 03/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class DataSources: NSObject, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.upConsultationTableViewCell, for: indexPath)!
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let drProfile = R.storyboard.dashboard.drProfileTableViewController()!
        
    }
 
}
