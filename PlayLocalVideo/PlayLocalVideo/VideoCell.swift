//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by Phoenix on 2017/3/11.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

public let VideoCellHeight: CGFloat = 220.0

class VideoCell: UITableViewCell {
    
    var videoScreenShot: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var videoTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next-Heavy", size: 15)
        label.textColor = UIColor.white
        return label
    }()
    
    var videoSourceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next", size: 10)
        label.textColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.7)
        return label
    }()
    
    var videoPlayButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "playBtn"), for: UIControlState.normal)
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(videoScreenShot)
        self.addSubview(videoTitleLabel)
        self.addSubview(videoSourceLabel)
        self.addSubview(videoPlayButton)
        
        videoScreenShot.frame = CGRect(x: 0,
                                       y: 0,
                                       width: UIScreen.main.bounds.size.width,
                                       height: VideoCellHeight)
        
        videoSourceLabel.frame = CGRect(x: 0,
                                        y: VideoCellHeight - 20 - 5,
                                        width: UIScreen.main.bounds.size.width,
                                        height: 20)
        
        videoTitleLabel.frame = CGRect(x: 0,
                                       y: videoSourceLabel.frame.minY - 5 - 25,
                                       width: UIScreen.main.bounds.size.width,
                                       height: 25)
        
        videoPlayButton.frame = CGRect(x: (UIScreen.main.bounds.size.width - 200) / 2,
                                       y: videoTitleLabel.frame.minY - 5 - 150 ,
                                       width: 200,
                                       height: 150)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
