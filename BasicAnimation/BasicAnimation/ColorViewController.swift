//
//  ColorViewController.swift
//  BasicAnimation
//
//  Created by Phoenix on 2017/4/24.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.7,
                       delay: 0.2,
                       options: .curveEaseIn,
                       animations: { () -> Void in
                        
                        self.view.backgroundColor = UIColor.black
                        
        }, completion: nil )
        
    }
    
}
