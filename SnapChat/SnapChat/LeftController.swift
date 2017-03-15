//
//  LeftController.swift
//  SnapChat
//
//  Created by Phoenix on 2017/3/14.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class LeftController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let imageView = UIImageView()
        imageView.image = UIImage(named: "left.jpg")
        view.addSubview(imageView)
        imageView.frame = view.bounds
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
