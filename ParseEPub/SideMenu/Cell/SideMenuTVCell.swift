//
//  SideMenuTVCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class SideMenuTVCell: UITableViewCell {

    let chapterLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        label.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        return label
    }()
    
    func setChapterLabelConstraints(){
        chapterLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chapterLabel.topAnchor.constraint(equalTo: topAnchor),
            chapterLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            chapterLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(chapterLabel)
        setChapterLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
