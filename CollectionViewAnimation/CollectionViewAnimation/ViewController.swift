//
//  ViewController.swift
//  CollectionViewAnimation
//
//  Created by Phoenix on 2017/4/14.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate,
                      UICollectionViewDelegateFlowLayout {
    
    var imageCollections: ImageCollection?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate struct AboutCell {
        static let CellIdentifier = String(describing: AnimationCell())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollections = ImageCollection()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AnimationCell.self, forCellWithReuseIdentifier: AboutCell.CellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollections!.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutCell.CellIdentifier,
                                                      for: indexPath) as? AnimationCell
        let viewModel = imageCollections?.images.safeIndex(indexPath.row)
        
        guard (cell != nil), (viewModel != nil) else {
            return UICollectionViewCell()
        }
        cell?.prepareCell(viewModel!)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.size.width, height: 240)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCell else { return }
        self.handleAnimation(collectionView, cell: cell)
    }
    
    fileprivate func handleAnimation(_ collectionView: UICollectionView, cell: AnimationCell) {
        
        cell.handleCellSlected()
        cell.backButtonDidClickCallBack = self.backButtonDidTouch
        
        let animation: () -> () = {
            cell.frame = collectionView.bounds
        }
        
        let completion: (_ finished: Bool) -> () = { _ in
            collectionView.isScrollEnabled = false
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: [],
                       animations: animation,
                       completion: completion)
    }
    
    func backButtonDidTouch() {
        guard let indexPaths = self.collectionView?.indexPathsForSelectedItems else {
            return
        }
        
        collectionView?.isScrollEnabled = true
        collectionView?.reloadItems(at: indexPaths)
    }
    
    /*
    @available(iOS 6.0, *)
    optional public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    
    @available(iOS 6.0, *)
    optional public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    
    @available(iOS 6.0, *)
    optional public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    
    @available(iOS 6.0, *)
    optional public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    
    @available(iOS 6.0, *)
    optional public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    
    @available(iOS 6.0, *)
    optional public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    */
}

extension Array {
    func safeIndex(_ i: Int) -> Element? {
        return i < self.count && i >= 0 ? self[i] : nil
    }
}

