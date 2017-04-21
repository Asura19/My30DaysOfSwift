//
//  ImageCollection.swift
//  CollectionViewAnimation
//
//  Created by Phoenix on 2017/4/14.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import Foundation

struct ImageCollection {
    
    fileprivate let imagePaths = ["1", "2", "3", "4", "5", "1", "2", "3", "4", "5"]
    var images: [CellModel]
    
    init() {
        images = imagePaths.map {
            CellModel(imagePath: $0)
        }
    }
}
