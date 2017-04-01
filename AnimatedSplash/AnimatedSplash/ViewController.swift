//
//  ViewController.swift
//  AnimatedSplash
//
//  Created by Phoenix on 2017/4/1.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "screen")
        imageView.frame = UIScreen.main.bounds
        self.view.addSubview(imageView)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }


}

