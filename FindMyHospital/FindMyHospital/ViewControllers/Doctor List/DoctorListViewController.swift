//
//  DoctorListViewController.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 04/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class DoctorListViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
 
    

    @IBOutlet weak var doctorListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         setup()
       
    }
    
    func setup(){
        navigationItem.title = "Doctor List"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.doctorListTableViewCell, for: indexPath)!
        return cell
    }
    @IBAction func bookAppointMentBtnAction(_ sender: Any) {
        let bookAppointment = R.storyboard.dashboard.bookAppointmentViewController()!
        show(bookAppointment, sender: self)
        
    }
    @IBAction func viewProfileBtnAction(_ sender: UIButton) {
        let viewProfile = R.storyboard.dashboard.drProfileTableViewController()!
        show(viewProfile, sender: self)
    }
    
}
