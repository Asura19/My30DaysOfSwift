//
//  CellModel.swift
//  CollectionViewAnimation
//
//  Created by Phoenix on 2017/4/14.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import Foundation

struct CellModel {
    let imagePath: String
    
    init(imagePath: String?) {
        self.imagePath = imagePath ?? ""
    }
}
