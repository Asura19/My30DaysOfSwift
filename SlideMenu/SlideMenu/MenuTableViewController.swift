//
//  MenuTableViewController.swift
//  SlideMenu
//
//  Created by Phoenix on 2017/4/6.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var menuItems = [
        "Everyday Moments",
        "Popular",
        "Editors",
        "Upcoming",
        "Fresh",
        "Stock-photos",
        "Trending"
    ]
    var currentItem = "Everyday Moments"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red:0.109, green:0.114, blue:0.128, alpha:1)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.white : UIColor.gray
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let menuTableViewController = segue.source as! MenuTableViewController
        
        if let selectedRow = menuTableViewController.tableView.indexPathForSelectedRow?.row {
            currentItem = menuItems[selectedRow]
        }
    }

}
