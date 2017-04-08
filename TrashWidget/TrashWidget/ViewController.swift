//
//  ViewController.swift
//  TrashWidget
//
//  Created by kentomaruta on 2017/01/07.
//  Copyright © 2017年 kentomaruta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeLable: UILabel!
    let defaults = UserDefaults(suiteName: TrashDefinition.defaultSuite)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var setTime = ""
        if (defaults.object(forKey: TrashDefinition.timerLimitKey) != nil) {
            setTime = defaults.string(forKey: TrashDefinition.timerLimitKey)!
            self.timeSlider.value = Float(setTime)!
            self.timeLable.text = setTime + "時"
            print("get setting timer : " + setTime + "時")
        } else {
            setTime = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateSlider(_ sender: UISlider) {
        // スライダーの位置を取得して時間セット
        let level = String(Int(self.timeSlider.value))
        self.timeLable.text = level + "時"
        defaults.set(level, forKey: TrashDefinition.timerLimitKey)
    }
}

