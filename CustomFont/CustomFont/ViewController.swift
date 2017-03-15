//
//  ViewController.swift
//  CustomFont
//
//  Created by Phoenix on 2017/3/10.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contents = [
        "Swift Exercise",
        "这些字体特别适合打「奋斗」和「理想」",
        "谢谢「造字工房」，本案例不涉及商业使用",
        "Phoenix",
        "当一艘船消失天际",
        "18600227057",
        "Here comes the sun",
        "再给我一次机会讲故事改写"
    ]
    
    var fontIndex = 0
    var fontNames = [
        "MFTongXin_Noncommercial-Regular",
        "MFJinHei_Noncommercial-Regular",
        "MFZhiHei_Noncommercial-Regular",
        "edundot",
        "Gaspar Regular"
    ]
    
    var changeFontButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.setTitle("Change Font", for: UIControlState.normal)
        button.setTitleColor(UIColor.gray, for: UIControlState.normal)
        button.backgroundColor = UIColor.yellow
        button.addTarget(self, action: #selector(changeFont(button:)), for: .touchUpInside)
        return button
    }()
    
    var tableView: UITableView?
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames {
            print(family)
        }
        
        
        self.title = "Custom Font"
        self.navigationController!.navigationBar.barStyle = .blackTranslucent
        self.navigationController!.navigationBar.tintColor = UIColor.white
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.black
        tableView?.separatorStyle = .none
        view.addSubview(tableView!)
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        view.addSubview(changeFontButton)
        let width: CGFloat = 150.0
        let x = (UIScreen.main.bounds.size.width - width) / 2.0
        let y = UIScreen.main.bounds.size.height - width - 50
        changeFontButton.frame = CGRect.init(x: x,
                                             y: y,
                                             width: width,
                                             height: width)
        changeFontButton.titleLabel?.font = UIFont(name: fontNames[4], size: 17)
        changeFontButton.clipsToBounds = true
        changeFontButton.layer.cornerRadius = width / 2.0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as UITableViewCell!
        cell.textLabel?.text = contents[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: fontNames[fontIndex], size: 16)
        cell.contentView.backgroundColor = UIColor.black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    @objc private func changeFont(button: UIButton) {
        fontIndex = (fontIndex + 1) % fontNames.count
        tableView?.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
