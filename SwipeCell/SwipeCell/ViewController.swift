//
//  ViewController.swift
//  SwipeCell
//
//  Created by Phoenix on 2017/4/21.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let array = [
        "Kurt",
        "Dave",
        "Kris",
        "Axl",
        "Slash",
        "Izzy",
        "Duff",
        "Matt",
        "John",
        "Paul",
        "George",
        "Ringo",
        "Yoshiki",
        "Toshi",
        "Hide",
        "Pata",
        "Taiji",
        "Sugizo",
        "Heath"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as? TestCell
        cell?.label.text = self.array[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (action, index) in
            print("Delete")
        }
        delete.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        let share = UITableViewRowAction(style: .normal, title: "Share") { (action, index) in
            let activityController = UIActivityViewController(activityItems: [self.array[index.row]], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        share.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        let download = UITableViewRowAction(style: .normal, title: "Download") { (action, index) in
            print("Download")
        }
        download.backgroundColor = UIColor(white: 0.85, alpha: 1.0)
        
        return [download, share, delete]
        
    }
    

}

