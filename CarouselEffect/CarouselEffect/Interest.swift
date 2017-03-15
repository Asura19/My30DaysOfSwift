//
//  Interest.swift
//  CarouselEffect
//
//  Created by Phoenix on 2017/3/15.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class Interest: NSObject {
    var title = ""
    var desc = ""
    var feturedImage: UIImage!
    
    init(title: String, desc: String, image: UIImage!) {
        self.title = title
        self.desc = desc
        self.feturedImage = image
    }
    
    static func createInterests() -> [Interest] {
        return [
            Interest(title: "Hello there, i miss u.", desc: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "hello")!),
            Interest(title: "🐳🐳🐳🐳🐳", desc: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "dudu")!),
            Interest(title: "Training like this, #bodyline", desc: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "bodyline")!),
            Interest(title: "I'm hungry, indeed.", desc: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "wave")!),
            Interest(title: "Dark Varder, #emoji", desc: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "darkvarder")!),
            Interest(title: "I have no idea, bitch", desc: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "hhhhh")!)
        ]
    }
}
