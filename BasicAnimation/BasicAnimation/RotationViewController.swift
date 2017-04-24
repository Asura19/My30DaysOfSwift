//
//  RotationViewController.swift
//  BasicAnimation
//
//  Created by Phoenix on 2017/4/24.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.rotate()
    }

    func rotate() {
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveLinear, animations: {
            self.imageView.transform = self.imageView.transform.rotated(by: .pi)
        }) { (finished) in
            self.rotate()
        }
    }

}
