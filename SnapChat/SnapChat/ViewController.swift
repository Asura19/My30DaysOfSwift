//
//  ViewController.swift
//  SnapChat
//
//  Created by Phoenix on 2017/3/14.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let left = LeftController()
        let right = RightController()
        let camera = CameraController()
        
        self.addChildViewController(left)
        self.addChildViewController(camera)
        self.addChildViewController(right)
        
        self.scrollView.addSubview(left.view)
        self.scrollView.addSubview(camera.view)
        self.scrollView.addSubview(right.view)
        
        self.scrollView.contentSize = CGSize(width: 3 * UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.scrollView.isPagingEnabled = true
        left.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        camera.view.frame = CGRect(x: UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        right.view.frame = CGRect(x: UIScreen.main.bounds.size.width * 2, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
    }


}

