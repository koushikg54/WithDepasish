//
//  MemberListViewController.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 04/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class MemberListViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var memberlListTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
         setup()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
       navigationItem.title = "Member List"
       memberlListTableView.tableFooterView = UIView()
    }
    
    @IBAction func addNewMbBtnAction(_ sender: Any) {
        let addMember = R.storyboard.dashboard.addNewMbListViewController()!
        show(addMember, sender: self)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.memberListTableViewCell, for: indexPath)!
        return cell
    }

}
