//
//  DefaultViewController.swift
//  3DTouch
//
//  Created by Phoenix on 2017/4/22.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let item = UIApplicationShortcutItem(type: "two",
                                             localizedTitle: "Phoenix",
                                             localizedSubtitle: "Make a Call",
                                             icon: UIApplicationShortcutIcon(type: .cloud),
                                             userInfo: nil)
        
        UIApplication.shared.shortcutItems = [item]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func unwindToMain(_ sender: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }

}
