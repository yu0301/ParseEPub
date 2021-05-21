//
//  AlignmentTableViewCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/8.
//

import UIKit

class AlignmentTableViewCell: UITableViewCell {

    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "對齊方式"
        label.font =  UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    let fontLabel:UILabel = {
        let label = UILabel()
        label.text = "預設"
//        label.font =  UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    //MARK:- constraints
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: fullScreenX * 0.05).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setFontLabelConstraints(){
        fontLabel.translatesAutoresizingMaskIntoConstraints = false
        fontLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -fullScreenX * 0.05).isActive = true
        fontLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(fontLabel)
        setTitleLabelConstraints()
        setFontLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
