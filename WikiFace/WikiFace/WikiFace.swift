//
//  WikiFace.swift
//  WikiFace
//
//  Created by Phoenix on 2017/4/26.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit
import SwiftyJSON

class WikiFace: NSObject {
    
    enum WikiError: Error {
        case coundNotDownloadImage
    }
    
    class func faceForPerson(_ person: String,
                             size: CGSize,
                             completion:@escaping (_ image: UIImage?, _ imageFound: Bool?) -> ()) throws {
        
        let escapedString = person.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
        let pixelsForAPIRequest = Int(max(size.width, size.height)) * 2
        let url = URL(string: "https://en.wikipedia.org/w/api.php?action=query&titles=\(escapedString!)&prop=pageimages&format=json&pithumbsize=\(pixelsForAPIRequest)")
        
        let task: URLSessionTask? = URLSession.shared.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                let json = JSON(data: data!)
                if let imageURL = json["query"]["pages"].dictionaryValue.first?.value["thumbnail"]["source"].string {
                    let imageData = try! Data(contentsOf: URL(string: imageURL)!)
                    let image = UIImage(data: imageData)
                    completion(image, true)
                }
                else {
                    completion(nil, false)
                }
            }
            else {
                completion(nil, false)
            }
        }
        
        guard task != nil else {
            throw WikiError.coundNotDownloadImage
        }
        
        task!.resume()
    }
    
    // face detect
    class func centerImageViewOnFace(_ imageView: UIImageView) {
        
        let context = CIContext(options: nil)
        let options = [CIDetectorAccuracy:CIDetectorAccuracyHigh]
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: options)
        
        let faceImage = imageView.image
        let ciImage = CIImage(cgImage: faceImage!.cgImage!)
        
        let features = detector?.features(in: ciImage)
        
        if (features?.count)! > 0 {
            
            var face:CIFaceFeature!
            
            for rect in features! {
                face = rect as! CIFaceFeature
            }
            
            var faceRectWithExtendedBounds = face.bounds
            faceRectWithExtendedBounds.origin.x -= 20
            faceRectWithExtendedBounds.origin.y -= 30
            
            faceRectWithExtendedBounds.size.width += 40
            faceRectWithExtendedBounds.size.height += 60
            
            let x = faceRectWithExtendedBounds.origin.x / faceImage!.size.width
            let y = (faceImage!.size.height - faceRectWithExtendedBounds.origin.y - faceRectWithExtendedBounds.size.height) / faceImage!.size.height
            
            let widthFace = faceRectWithExtendedBounds.size.width / faceImage!.size.width
            let heightFace = faceRectWithExtendedBounds.size.height  / faceImage!.size.height
            
            imageView.layer.contentsRect = CGRect(x: x, y: y, width: widthFace, height: heightFace)
            
        }
    }
}
