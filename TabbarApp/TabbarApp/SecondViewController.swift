//
//  SecondViewController.swift
//  TabbarApp
//
//  Created by Phoenix on 2017/4/25.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var exploreImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exploreImageView.alpha = 0
        self.exploreImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: { () -> Void in
            
            self.exploreImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.exploreImageView.alpha = 1
            
        }, completion: nil )
    }

}
