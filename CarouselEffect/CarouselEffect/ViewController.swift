//
//  ViewController.swift
//  CarouselEffect
//
//  Created by Phoenix on 2017/3/15.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

let CellIdentifier = "InterestCell"
let CellWidth: CGFloat = UIScreen.main.bounds.size.width * 0.80
let CellHeight: CGFloat = CellWidth * 4 / 3
let Margin: CGFloat = 15

import UIKit

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: CellWidth, height: CellHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: Margin, bottom: 0, right: Margin)
        layout.minimumLineSpacing = Margin
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        collection.showsHorizontalScrollIndicator = false
        collection.register(InterestCell.self, forCellWithReuseIdentifier: CellIdentifier)
        return collection
    }()
    
    fileprivate var interests = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.center = view.center
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! InterestCell
        cell.interest = interests[indexPath.row]
        return cell
    }
}
