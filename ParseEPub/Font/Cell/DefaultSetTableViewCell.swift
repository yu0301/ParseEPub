//
//  DefaultSetTableViewCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/8.
//

import UIKit

class DefaultSetTableViewCell: UITableViewCell {

    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "出版社預設排版"
        label.font =  UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    let resetButton:UIButton = {
        let button = UIButton()
        button.setTitle("重設", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = fullScreenX * 0.04
        return button
    }()
    
    //MARK:- constraints
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: fullScreenX * 0.05).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setResetButtonConstraints(){
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -fullScreenX * 0.05).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: fullScreenX * 0.2).isActive = true
        resetButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(resetButton)
        setTitleLabelConstraints()
        setResetButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
