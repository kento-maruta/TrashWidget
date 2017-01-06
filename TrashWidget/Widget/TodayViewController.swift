//
//  TodayViewController.swift
//  Widget
//
//  Created by kentomaruta on 2017/01/07.
//  Copyright © 2017年 kentomaruta. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var trashTypeLabel: UILabel!
    @IBOutlet weak var weekDayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func settingLabel() {
        trashTypeLabel.text = DateUtils.getTodayTrashType()
        weekDayLabel.text = DateUtils.getTodayWeekDayJa()
    }
}
