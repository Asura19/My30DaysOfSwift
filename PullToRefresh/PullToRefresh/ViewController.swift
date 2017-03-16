//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Phoenix on 2017/3/16.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let cellIdentifier = "cellIdentifier"
    
    var datas = ["Crimson flames tied through my ears", "Rollin' high and mighty traps", "Pounced with fire on flaming roads", "Using ideas as my maps"]
    
    var tableViewController = UITableViewController(style: .plain)
    var refreshControl = UIRefreshControl()
    var navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        let tableView = tableViewController.tableView
        tableView?.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 40.0
        tableView?.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 64)
        
        tableViewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(reload), for: UIControlEvents.valueChanged)
        
        self.refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attribute = [NSForegroundColorAttributeName: UIColor.white]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last time refresh on \(Date())", attributes: attribute)
        self.refreshControl.tintColor = UIColor.white
        
        let navItem = UINavigationItem()
        navItem.title = "Emoji"
        navBar.pushItem(navItem, animated: true)
        self.navBar.tintColor = UIColor.white
        self.navBar.barStyle = UIBarStyle.blackTranslucent
        
        self.view.addSubview(tableView!)
        self.view.addSubview(navBar)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)! as UITableViewCell
        
        cell.textLabel!.text = self.datas[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 20)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }

    func reload() {
        self.datas.append("new item")
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

