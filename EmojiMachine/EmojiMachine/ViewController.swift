//
//  ViewController.swift
//  EmojiMachine
//
//  Created by Phoenix on 2017/3/27.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var emojiPickerView: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var datas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let emojis = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0..<10 {
            datas.append(contentsOf: emojis)
        }
        emojiPickerView.dataSource = self
        emojiPickerView.delegate = self
    }
    
    
    @IBAction func goButtonClicked(_ sender: UIButton) {
        emojiPickerView.selectRow(Int(arc4random()) % 100, inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 100, inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 100, inComponent: 2, animated: true)
        
        if(datas[emojiPickerView.selectedRow(inComponent: 0)] == datas[emojiPickerView.selectedRow(inComponent: 1)] &&
           datas[emojiPickerView.selectedRow(inComponent: 1)] == datas[emojiPickerView.selectedRow(inComponent: 2)]) {
            resultLabel.text = "Bingo!"
        }
        else {
            resultLabel.text = "💔"
        }
        
        UIView.animate(withDuration: 0.1, animations: {
            self.goButton.transform = CGAffineTransform.init(scaleX: 1.05, y: 1.0)
        }) { (completed: Bool) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
                self.goButton.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.datas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.text = self.datas[row]
        label.font = UIFont(name: "Apple Color Emoji", size: 80)
        label.textAlignment = NSTextAlignment.center
        return label
    }

   


}

