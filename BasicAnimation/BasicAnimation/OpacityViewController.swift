//
//  OpacityViewController.swift
//  BasicAnimation
//
//  Created by Phoenix on 2017/4/24.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2, animations: {
            
            self.imageView.alpha = 0
            
        })
    }

}
