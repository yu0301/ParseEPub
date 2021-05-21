//
//  DateExtension.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/14.
//

import UIKit

extension Date {
    
    //先比較當前秒數，當秒數大於59則分鐘
    //再比較分鐘，當分鐘大於59則小時
    //再比較小時，當小時超過24則天
    
    //獲取當前時間
    var seconds : Int {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let seconds = Int(timeInterval)
        return seconds
    }
    
    var minutes:Int{
        let minutes = seconds / 60
        return minutes
    }
    
    var hours:Int{
        let hours = minutes / 60
        return hours
    }
    
    var days:Int{
        let days = hours / 60
        return days
    }
   
    
    //use enum 去排列
     var timeArray:[Int]{
        return [seconds,minutes,hours,days]
    }
  
}
