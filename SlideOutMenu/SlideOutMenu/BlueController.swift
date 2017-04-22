//
//  BlueController.swift
//  SlideOutMenu
//
//  Created by Phoenix on 2017/4/22.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class BlueController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }


}
