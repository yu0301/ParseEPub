//
//  FontTableViewCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/7.
//

import UIKit

class FontTableViewCell: UITableViewCell {

    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "字體"
        label.font =  UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.numberOfLines = 0
        return label
    }()
    
    let fontLabel:UILabel = {
        let label = UILabel()
        label.text = "思源宋體"
//        label.font =  UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.numberOfLines = 0
        return label
    }()
    
    //MARK:- constraints
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setFontLabelConstraints(){
        fontLabel.translatesAutoresizingMaskIntoConstraints = false
        fontLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -fullScreenX * 0.05).isActive = true
        fontLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        addSubview(titleLabel)
        addSubview(fontLabel)
        setTitleLabelConstraints()
        setFontLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

