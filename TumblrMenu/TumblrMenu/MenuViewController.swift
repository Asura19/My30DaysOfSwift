//
//  MenuViewController.swift
//  TumblrMenu
//
//  Created by Phoenix on 2017/4/7.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var photoLabel: UILabel!

    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!

    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var linkLabel: UILabel!

    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var chatLabel: UILabel!

    @IBOutlet weak var audioButton: UIButton!
    @IBOutlet weak var audioLabel: UILabel!

    let transitionAnimator = MenuAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = transitionAnimator
    }
}
