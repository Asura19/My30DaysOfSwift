//
//  WeighViewController.swift
//  3DTouch
//
//  Created by Phoenix on 2017/4/22.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class WeighViewController: UIViewController {

    @IBOutlet weak var round: UIView!
    @IBOutlet weak var weightLabel: UILabel!
    var centerPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.round.frame = CGRect.zero
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        self.centerPoint = touch?.location(in: touch?.view)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let force = touch?.force
        let maximumPossibleForce = touch?.maximumPossibleForce
        let quotient = force! / maximumPossibleForce!
        let border = self.view.frame.size.width
        self.round.layer.cornerRadius = border * 0.5 * quotient
        self.round.frame = CGRect(x: 0, y: 0, width: border * quotient, height: border * quotient)
        let point = touch?.location(in: touch?.view)
        self.round.center = point!
        
        let weight = 415 * quotient
        self.weightLabel.text = "\(weight) g"
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.round.frame = CGRect.zero
        self.weightLabel.text = "0 g"
    }

}
