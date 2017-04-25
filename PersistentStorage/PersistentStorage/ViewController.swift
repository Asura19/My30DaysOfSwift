//
//  ViewController.swift
//  PersistentStorage
//
//  Created by Phoenix on 2017/4/24.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DatasViewController") as! DatasViewController
        if indexPath.row == 0 {
            controller.persistentType = .coreData
        }
        else if indexPath.row == 1 {
            controller.persistentType = .realm
        }
        else {
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
