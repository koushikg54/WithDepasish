//
//  MenuViewController.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 01/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.menueTableViewCell, for: indexPath)!
        if indexPath.row == 1{
            cell.menuItemNamelabe.text = "Emergency Hospitals"
        }
        if indexPath.row == 2{
            cell.menuItemNamelabe.text = "Change Profile"
            cell.menuItemImageView.image = #imageLiteral(resourceName: "person")
        }
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2{
           let userProfile = R.storyboard.dashboard.userProfileViewController()!
//            show(userProfile, sender: self)
           // let controller = ProductsTableViewController()
            let navigationController:UINavigationController = UINavigationController(rootViewController: userProfile)
            self.revealViewController()?.pushFrontViewController(navigationController, animated: true)
           // self.navigationController?.pushViewController(navigationController, animated: true)
        
        }
        

    }
    
    
    
   
}
