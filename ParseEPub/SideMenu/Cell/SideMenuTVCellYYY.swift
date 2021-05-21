//
//  SideMenuTV.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class SideMenuTVCellYYY: UITableViewCell {

    let chapterLabel:UILabel = {
        let label = UILabel()
        label.text = "chapter1"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print(123)
      addSubview(chapterLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
