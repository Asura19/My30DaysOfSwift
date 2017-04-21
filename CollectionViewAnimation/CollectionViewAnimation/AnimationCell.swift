//
//  AnimationCell.swift
//  CollectionViewAnimation
//
//  Created by Phoenix on 2017/4/14.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class AnimationCell: UICollectionViewCell {
    
    var backButton: UIButton!
    var animationImageView: UIImageView!
    var animationTextView: UITextView!
    
    var backButtonDidClickCallBack: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.animationImageView = UIImageView()
        self.animationImageView.contentMode = UIViewContentMode.scaleAspectFill
        self.animationImageView.clipsToBounds = true
        self.contentView.addSubview(self.animationImageView)
        
        self.animationTextView = UITextView()
        self.animationTextView.text = "Hedge fund billionaire Bill Ackman was humbled in 2015. His Pershing Square Capital Management had a terrible year, posting a -19.3% gross return."
        self.contentView.addSubview(self.animationTextView)
        
        self.backButton = UIButton()
        self.backButton.setImage(UIImage(named: "Back-icon"), for: UIControlState.normal)
        self.backButton.addTarget(self, action: #selector(backButtonClicked), for: UIControlEvents.touchUpInside)
        self.contentView.addSubview(self.backButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backButton.frame = CGRect(x: 10, y: 12, width: 20, height: 24)
        self.animationImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 180)
        self.animationTextView.frame = CGRect(x: 0, y: 180, width: self.bounds.standardized.width, height: 60)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareCell(_ viewModel: CellModel) {
        self.animationImageView.image = UIImage(named: viewModel.imagePath)
        self.backButton.isHidden = true
    }
    
    func handleCellSlected() {
        self.animationTextView.isScrollEnabled = false
        self.backButton.isHidden = false
        self.superview?.bringSubview(toFront: self)
    }
    
    func backButtonClicked() {
        if let callBack = self.backButtonDidClickCallBack {
            callBack()
        }
    }
}
