//
//  ViewController.swift
//  SpotifyVedioBackground
//
//  Created by Phoenix on 2017/3/21.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, AVPlayerViewControllerDelegate {
    @IBOutlet weak var logoImage: UIImageView!
    
    let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
    var playControler: AVPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.playControler = AVPlayerViewController()
        self.playControler?.showsPlaybackControls = false
        self.playControler?.player = AVPlayer(url: self.url)
        self.playControler?.player?.isMuted = true
        self.playControler?.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.playControler?.view.frame = self.view.bounds
        view.insertSubview((self.playControler?.view)!, belowSubview: self.logoImage)
        self.playControler?.player?.play()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(videoEnd), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func videoEnd() {
        self.playControler?.player?.seek(to: CMTime(value: 0, timescale: 60))
        self.playControler?.player?.play()
    }
    
}

