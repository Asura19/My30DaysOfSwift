//
//  ContentViewController.swift
//  3DTouch
//
//  Created by Phoenix on 2017/4/22.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        let action = UIPreviewAction(title: "Save", style: .default) { (action: UIPreviewAction, controller: UIViewController) in
            print("Save image")
        }
        return [action]
    }

}
