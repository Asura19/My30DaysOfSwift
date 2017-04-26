//
//  ViewController.swift
//  Spotlight
//
//  Created by Phoenix on 2017/4/26.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var moviesInfo : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "MoviesData", ofType: "plist") {
            moviesInfo = NSMutableArray(contentsOfFile: path)
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        
        setupSearchableContent()
    }
    
    func setupSearchableContent() {
        var searchableItems = [CSSearchableItem]()
        
        for i in 0..<(moviesInfo.count) {
            let movie = moviesInfo[i] as! [String: String]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            
            searchableItemAttributeSet.title = movie["Title"]!
            
            let imagePathParts = movie["Image"]!.components(separatedBy: ".")
            searchableItemAttributeSet.thumbnailURL = Bundle.main.url(forResource: imagePathParts[0], withExtension: imagePathParts[1])
            
            searchableItemAttributeSet.contentDescription = movie["Description"]!
            
            var keywords = [String]()
            let movieCategories = movie["Category"]!.components(separatedBy: ", ")
            for movieCategory in movieCategories {
                keywords.append(movieCategory)
            }
            
            let stars = movie["Stars"]!.components(separatedBy: ", ")
            for star in stars {
                keywords.append(star)
            }
            
            searchableItemAttributeSet.keywords = keywords
            
            let searchItem = CSSearchableItem(uniqueIdentifier: "com.phoenix.spotlight.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            searchableItems.append(searchItem)
            
            CSSearchableIndex.default().indexSearchableItems(searchableItems, completionHandler: { (error) in
                if error != nil {
//                    print(error?.localizedDescription)
                }
            })
        }
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedMovie = userInfo[CSSearchableItemActivityIdentifier] as! String
                let selectedMovieIndex = Int(selectedMovie.components(separatedBy: ".").last!)
                self.push(movieInfo:moviesInfo[selectedMovieIndex!] as! [String: String])
            }
        }
    }
    
    func push(movieInfo: Dictionary<String, String>) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        controller.movieInfo = movieInfo
        self.navigationController?.pushViewController(controller, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if moviesInfo != nil {
            return moviesInfo.count
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let currentMovieInfo = moviesInfo[indexPath.row] as! [String: String]
        
        cell.titleLabel.text = currentMovieInfo["Title"]!
        cell.descriptionLabel.text = currentMovieInfo["Description"]!
        cell.rateLabel.text = currentMovieInfo["Rating"]!
        cell.movieImageView.image = UIImage(named: currentMovieInfo["Image"]!)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.push(movieInfo:moviesInfo[indexPath.row] as! [String: String])
    }

}

