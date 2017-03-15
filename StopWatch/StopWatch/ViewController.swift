//
//  ViewController.swift
//  StopWatch
//
//  Created by Phoenix on 2017/3/10.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0.0
    var isCounting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startToCount(_ sender: UIButton) {
        isCounting =  true
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @IBAction func pauseCounting(_ sender: UIButton) {
        if isCounting {
            isCounting = false
            timer.invalidate()
            playButton.isEnabled = true
            pauseButton.isEnabled = false
        }
    }
    
    @IBAction func resetCounter(_ sender: UIButton) {
        isCounting = false
        timer.invalidate()
        counter = 0.0
        timeLabel.text = "0"
        playButton.isEnabled = true
        pauseButton.isEnabled = true
    }
    
    func updateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
}

