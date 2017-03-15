//
//  InterestCell.swift
//  CarouselEffect
//
//  Created by Phoenix on 2017/3/15.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class InterestCell: UICollectionViewCell {
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    var imageView = UIImageView()
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.frame = CGRect(x: 0, y: 0, width: CellWidth, height: CellHeight)
        self.contentView.addSubview(self.imageView)
        
        let effect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: effect)
        blurView.frame = CGRect(x: 0, y: CellHeight - 50, width: CellWidth, height: 50)
        self.contentView.addSubview(blurView)
        
        
        self.label.textColor = UIColor.black
        self.label.font = UIFont(name: "Avenir Next", size: 16)
        self.label.backgroundColor = UIColor.clear
        self.label.frame = CGRect(x: 15, y: CellHeight - 50, width: CellWidth - 30, height: 50)
        self.contentView.addSubview(self.label)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func updateUI() {
        imageView.image = interest.feturedImage
        label.text = interest.title
    }
}
