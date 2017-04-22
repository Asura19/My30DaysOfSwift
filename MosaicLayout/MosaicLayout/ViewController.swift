//
//  ViewController.swift
//  MosaicLayout
//
//  Created by Phoenix on 2017/4/22.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageCell"

class ViewController: UICollectionViewController {
    
    var imageArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...21 {
            imageArray.append("\(i)")
        }

        self.collectionView?.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
     
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCell
        
        let randomBlue = CGFloat(drand48())
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        cell.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
        cell.alpha = 0
        
        // performance problem, still lag
        DispatchQueue.global(qos: .userInitiated).async {
            let image = UIImage(named: self.imageArray[indexPath.row])
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        }
        
        
        let cellDelay = UInt64((arc4random() % 600 ) / 1000 )
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(cellDelay * NSEC_PER_SEC )) / Double(NSEC_PER_SEC), execute: ({ () -> Void in
            
            UIView.animate(withDuration: 0.8, animations: ({
                
                cell.alpha = 1.0
                
            }))
            
        }))
        
        return cell
    }
    
}

extension ViewController: TRMosaicLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(3, 3, 3, 3)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }
    
}
