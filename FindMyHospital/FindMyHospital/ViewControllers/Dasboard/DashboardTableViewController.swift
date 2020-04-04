//
//  DashboardTableViewController.swift
//  FindMyHospital
//
//  Created by Ayush Kumar Sethi on 03/04/20.
//  Copyright © 2020 Debasish Mondal. All rights reserved.
//

import UIKit

class DashboardTableViewController: UITableViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
  //  @IBOutlet weak var locBarBtn: UIBarButtonItem!
    @IBOutlet weak var topRatedDrCollectionView: UICollectionView!
    @IBOutlet weak var topRatedHospCollectionView: UICollectionView!
    @IBOutlet weak var specializationCollectionView: UICollectionView!
    @IBOutlet weak var tableViewUpcomingConsul: UITableView!
    @IBOutlet weak var rightBarBtnMember: UIBarButtonItem!
    var datasource = DataSources()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//     locBarBtn.image = UIImage(named:"pin")?.withRenderingMode(.alwaysOriginal)
       setUpLeftBarButtons()
       setUpRightBarButtons()
         rightBarBtnMember.image = UIImage(named:"account")?.withRenderingMode(.alwaysOriginal)
        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        tableViewUpcomingConsul.delegate = datasource
        tableViewUpcomingConsul.dataSource = datasource
    }
    
    func setUpLeftBarButtons(){
        let locBtn = UIButton(type: .custom)
        locBtn.frame = CGRect(x: 0.0, y: 0.0, width: 15, height: 20)
        locBtn.setImage(UIImage(named:"pin"), for: .normal)
        
        let locBarItem = UIBarButtonItem(customView: locBtn)
        let currWidth2 = locBarItem.customView?.widthAnchor.constraint(equalToConstant: 15)
        currWidth2?.isActive = true
        let currHeight2 = locBarItem.customView?.heightAnchor.constraint(equalToConstant:  20)
        currHeight2?.isActive = true
        
        let locPalceBarItem = UIBarButtonItem(title: "Sirsa", style: .done, target: self, action: #selector(onLoctionBarBtnPressed))
        let currWidth = locPalceBarItem.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = locPalceBarItem.customView?.heightAnchor.constraint(equalToConstant: 24)
        
        self.navigationItem.leftBarButtonItems = [menuBarButton,locBarItem,locPalceBarItem]
    }
    
    
    func setUpRightBarButtons(){
        let searchBtn = UIButton(type: .custom)
        searchBtn.frame = CGRect(x: 0.0, y: 0.0, width: 15, height: 20)
        searchBtn.setImage(UIImage(named:"search"), for: .normal)
        
        let searchBarItem = UIBarButtonItem(customView: searchBtn)
        let currWidth2 = searchBarItem.customView?.widthAnchor.constraint(equalToConstant: 20)
        currWidth2?.isActive = true
        let currHeight2 = searchBarItem.customView?.heightAnchor.constraint(equalToConstant:  20)
        currHeight2?.isActive = true
        
     
        
        self.navigationItem.rightBarButtonItems = [rightBarBtnMember,searchBarItem]
    }
    
    
    
    @objc func onLoctionBarBtnPressed(){
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    @objc func onMenuButtonPressed(){
         self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    
    func setUpMenuButton2(){
        let menuBtn = UIButton(type: .custom)
        menuBtn.frame = CGRect(x: 30.0, y: 0.0, width: 20, height: 20)
        menuBtn.setImage(UIImage(named:"pin"), for: .normal)
        menuBtn.titleLabel!.text = "Sirsa"
        //        menuBtn.addTarget(self, action: #selector(vc.onMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        self.navigationItem.leftBarButtonItem = menuBarItem
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == specializationCollectionView{
            return 10
        }else if collectionView == topRatedDrCollectionView {
            return 3
        }else {
            return 5
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == specializationCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.specializationCollectionViewCell, for: indexPath)!
            return cell
        }else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.topRatedDrCollectionViewCell, for: indexPath)!
            return cell2
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == topRatedDrCollectionView{
            let drProfile = R.storyboard.dashboard.drProfileTableViewController()!
            show(drProfile, sender: self)
        }
        if collectionView == topRatedHospCollectionView{
            let doctorList = R.storyboard.dashboard.doctorListViewController()!
            show(doctorList, sender: self)
        }
        
        if collectionView == specializationCollectionView{
            let emergencyHosp = R.storyboard.dashboard.emergencyHospViewController()!
            show(emergencyHosp, sender: self)
        }
    }
    @IBAction func emergencyBtnAction(_ sender: UIButton) {
       let emergencyHosp = R.storyboard.dashboard.emergencyHospViewController()!
        show(emergencyHosp, sender: self)
    }



    @IBAction func menuBarButtonAction(_ sender: UIBarButtonItem) {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    @IBAction func memberBarButtonAction(_ sender: Any) {
        let memberList = R.storyboard.dashboard.memberListViewController()!
        show(memberList, sender: self)
    }
    

}
