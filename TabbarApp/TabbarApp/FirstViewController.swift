//
//  FirstViewController.swift
//  TabbarApp
//
//  Created by Phoenix on 2017/4/25.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var articleTableView: UITableView!
    
    var data = [
        
        Article(avatarImage: "allen", sharedName: "Allen Wang", actionType: "Read Later", articleTitle: "Giphy Cam Lets You Create And Share Homemade Gifs", articleCoverImage: "giphy", articleSouce: "TheNextWeb", articleTime: "5min  •  13:20"),
        Article(avatarImage: "Daniel Hooper", sharedName: "Daniel Hooper", actionType: "Shared on Twitter", articleTitle: "Principle. The Sketch of Prototyping Tools", articleCoverImage: "my workflow flow", articleSouce: "SketchTalk", articleTime: "3min  •  12:57"),
        Article(avatarImage: "davidbeckham", sharedName: "David Beckham", actionType: "Shared on Facebook", articleTitle: "Ohlala, An Uber For Escorts, Launches Its ‘Paid Dating’ Service In NYC", articleCoverImage: "Ohlala", articleSouce: "TechCrunch", articleTime: "1min  •  12:59"),
        Article(avatarImage: "bruce", sharedName: "Bruce Fan", actionType: "Shared on Weibo", articleTitle: "Lonely Planet’s new mobile app helps you explore major cities like a pro", articleCoverImage: "Lonely Planet", articleSouce: "36Kr", articleTime: "5min  •  11:21"),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articleTableView.frame = view.bounds
        articleTableView.dataSource = self
        articleTableView.delegate = self
        articleTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        articleTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }

    func animateTable() {
        
        self.articleTableView.reloadData()
        
        let cells = articleTableView.visibleCells
        let tableHeight: CGFloat = articleTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = articleTableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        let article = data[indexPath.row]
        
        cell.avatarImageView.image = UIImage(named: article.avatarImage)
        cell.articleCoverImage.image = UIImage(named: article.articleCoverImage)
        cell.sharedNameLabel.text = article.sharedName
        cell.actionTypeLabel.text = article.actionType
        cell.articleTitleLabel.text = article.articleTitle
        cell.articleSouceLabel.text = article.articleSouce
        cell.articelCreatedAtLabel.text = article.articleTime
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
        
    }
}
