//
//  DateUtils.swift
//  TrashWidget
//
//  Created by kentomaruta on 2017/01/07.
//  Copyright © 2017年 kentomaruta. All rights reserved.
//

import Foundation

class DateUtils {
    
    //今日の曜日取得
    static func getTodayWeekDayJa() -> String {
        let date: NSDate = NSDate()
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let comp: NSDateComponents = cal.components(
            [NSCalendar.Unit.weekday],
            from: date as Date
        ) as NSDateComponents
        let weekday: Int = comp.weekday
        
        let weekdaySymbolIndex: Int = weekday - 1
        let formatter: DateFormatter = DateFormatter()
        
        formatter.locale = NSLocale(localeIdentifier: "ja") as Locale!
        
        // -> 日
        //formatter.shortWeekdaySymbols[weekdaySymbolIndex]
        // -> 日曜日
        //formatter.weekdaySymbols[weekdaySymbolIndex]
        
        return formatter.shortWeekdaySymbols[weekdaySymbolIndex]
    }
    
    static func getTodayTrashType() -> String {
        
        switch getTodayWeekDayJa() {
            case "月":
                return TrashDefinition.monday
            case "火":
                return TrashDefinition.tuesday
            case "水":
                return TrashDefinition.wednesday
            case "木":
                return TrashDefinition.thursday
            case "金":
                return TrashDefinition.friday
            case "土":
                return TrashDefinition.saturday
            case "日":
                return TrashDefinition.sunday
            default:
                return "おかしい"
        }
    }
}
