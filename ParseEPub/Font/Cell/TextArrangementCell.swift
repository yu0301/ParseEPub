//
//  TextArrangementCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/7.
//

import UIKit

class TextArrangementCell: UITableViewCell {
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "橫直排設定"
        label.font =  UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    let arrangementControll:UISegmentedControl = {
        let arrangementControll = UISegmentedControl(items: ["橫排","直排"])
        arrangementControll.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        arrangementControll.selectedSegmentIndex = 1
        return arrangementControll
    }()
    
    //MARK:- constraints
    
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: fullScreenX * 0.05).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setArrangementControllConstaints(){
        arrangementControll.translatesAutoresizingMaskIntoConstraints = false
        arrangementControll.widthAnchor.constraint(equalToConstant: fullScreenX * 0.3).isActive = true
        arrangementControll.heightAnchor.constraint(equalToConstant: fullScreenY * 0.08).isActive = true
        arrangementControll.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrangementControll.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    
    @objc func onChange(sender: UISegmentedControl) {
        // 印出選到哪個選項 從 0 開始算起
        print(sender.selectedSegmentIndex)

        // 印出這個選項的文字
        print(
            sender.titleForSegment(
                at: sender.selectedSegmentIndex))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        contentView.addSubview(arrangementControll)
        setTitleLabelConstraints()
        setArrangementControllConstaints()
        
        arrangementControll.addTarget(self, action: #selector(onChange), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
