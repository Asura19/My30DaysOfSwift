//
//  ViewController.swift
//  CustomPullToRefresh
//
//  Created by Phoenix on 2017/4/11.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    var customView: UIView!
    var labelsArray: Array<UILabel> = []
    var timer: Timer!
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var isAnimating = false
    var dataArray: Array<String> = ["😂", "🤗", "😳", "😌", "😊"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.tintColor = UIColor.clear
        tableView.addSubview(refreshControl)
        
        loadCustomRefreshContents()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        
        cell.textLabel!.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func loadCustomRefreshContents() {
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
        customView = refreshContents?[0] as! UIView
        customView.frame = self.refreshControl.bounds
        refreshControl.addSubview(self.customView)
        
        for view in customView.subviews {
            self.labelsArray.insert(view as! UILabel, at: 0)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshControl.isRefreshing {
            if !isAnimating {
                timer = Timer.scheduledTimer(timeInterval: 5,
                                             target: self,
                                             selector: #selector(endRefreshing),
                                             userInfo: nil,
                                             repeats: true)
                animateRefreshStep1()
            }
        }
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    
    func getNextColor() -> UIColor {
        var colorsArray: Array<UIColor> = [
            UIColor.magenta,
            UIColor.brown,
            UIColor.yellow,
            UIColor.red,
            UIColor.green,
            UIColor.blue,
            UIColor.orange
        ]
        
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        
        return returnColor
    }
    
    func animateRefreshStep1() {
        
        isAnimating = true
        
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveLinear,
                       animations: {
                        
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: .pi / 4)
            self.labelsArray[self.currentLabelIndex].textColor = self.getNextColor()
                        
        }, completion: { _ in
            UIView.animate(withDuration: 0.05,
                           delay: 0.0,
                           options: UIViewAnimationOptions.curveLinear,
                           animations: {
                            
                self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform.identity
                self.labelsArray[self.currentLabelIndex].textColor = UIColor.black
                            
            }, completion: { _ in
                self.currentLabelIndex += 1
                if self.currentLabelIndex < self.labelsArray.count {
                    self.animateRefreshStep1()
                }
                else {
                    self.animateRefreshStep2()
                }
            })
        })
        
    }
    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveLinear,
                       animations: {
                        
            for label in self.labelsArray {
                label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
                        
        }, completion: { _ in
            
            UIView.animate(withDuration: 0.05,
                           delay: 0.0,
                           options: UIViewAnimationOptions.curveLinear,
                           animations: {
                     
                for label in self.labelsArray {
                    label.transform = CGAffineTransform.identity
                }
                            
            }, completion: { _ in
                
                self.currentLabelIndex = 0
                
                if self.refreshControl.isRefreshing {
                    self.animateRefreshStep1()
                }
                else {
                    self.isAnimating = false
                }
            })
        })
    }
}

