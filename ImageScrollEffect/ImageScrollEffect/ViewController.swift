//
//  ViewController.swift
//  ImageScrollEffect
//
//  Created by Phoenix on 2017/3/20.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "sagi.jpg"))
        setupScrollView()
        setZoomScaleSize(scrollViewSize: scrollView.bounds.size)
        
        setImageCenter()
    }

    func setupScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }

    func setZoomScaleSize(scrollViewSize: CGSize) {
        let imageSize = imageView.frame.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let miniScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = miniScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = miniScale
    }
    
    func setImageCenter() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        var verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2.0 :0
        verticalSpace = fabs(verticalSpace)
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        self.setImageCenter()
    }
}

