//
//  ScaleViewController.swift
//  BasicAnimation
//
//  Created by Phoenix on 2017/4/24.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.alpha = 0;
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.imageView.alpha = 1;
        }, completion: nil)
    }

}
