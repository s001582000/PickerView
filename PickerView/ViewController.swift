//
//  ViewController.swift
//  PickerView
//
//  Created by 梁雅軒 on 2017/3/24.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var arrTitle = ["請選擇","公立","私立","科大"]
    var dicContent = ["公立":["台大","成大","清大","交大"],"私立":["中原","輔大","東吳"],"科大":["台科","北科","雲科","虎尾"]]
    var currentTitle:String?
    
    
    var currentType = "公立"
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return currentTitle == nil ? 1 : 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return arrTitle.count
        }
        if let contentTitle = currentTitle {
            let arrContent = dicContent[contentTitle]
            return arrContent!.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return arrTitle[row]
        }
        if let contentTitle = currentTitle {
            let arrContent = dicContent[contentTitle]
            return arrContent![row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            if row == 0 {
                currentTitle = nil
            }else{
                currentTitle = arrTitle[row]
            }
            pickerView.reloadAllComponents()
        }
    }
}
