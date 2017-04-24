//
//  PositionViewController.swift
//  BasicAnimation
//
//  Created by Phoenix on 2017/4/24.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {

    @IBOutlet weak var roundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: { 
            self.roundView.transform = CGAffineTransform(translationX: 0, y: 200)
        }, completion: nil)
    }

}
