//
//  MainVC + RefreshData.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/13.
//

import Foundation

extension MainVC{
    
    @objc func refreshBookMarData(){
        self.bookMarkData = UserDefaultData.loadBookMarkData()
    }
    
    @objc func refreshUnderLineData(){
        self.underLineData = UserDefaultData.loadUnderLineData()
    }
    
    func notification(){
        NotificationCenter.default.addObserver(self, selector: #selector(refreshBookMarData), name: NSNotification.Name("reloadtv") , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshUnderLineData), name: NSNotification.Name("reloadTV") , object: nil)
    }
    
}
