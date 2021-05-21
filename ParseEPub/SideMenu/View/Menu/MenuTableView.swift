//
//  MenuTableView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/25.
//

import UIKit

class MenuTableView: UITableView {

    var chapterTitleArray:[String]!
    var chapterPathAray:[String]!
    
    let footerView = UIView()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
       register(SideMenuTVCell.self, forCellReuseIdentifier: SideMenuTVCell.cellIdentifier())
       tableFooterView = footerView
       rowHeight = fullScreenY * 0.05
    }
    
    convenience init(titleArray:[String],chapterPathArray:[String]) {
        self.init()
        self.chapterTitleArray = titleArray
        self.chapterPathAray = chapterPathArray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
