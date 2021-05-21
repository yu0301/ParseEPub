//
//  BackGroundStackView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/10.
//

import UIKit

class BackGroundStackView: UIStackView {

    let lightButton:UIButton = {
        let button = UIButton()
        button.setTitle("明亮", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = fullScreenX * 0.05
        button.tag = 0
        return button
    }()
    
    let nightButton:UIButton = {
        let button = UIButton()
        button.setTitle("夜間", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = fullScreenX * 0.05
        button.tag = 1
        return button
    }()
    
    let classicalButton:UIButton = {
        let button = UIButton()
        button.setTitle("復古", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.7803921569, green: 0.5058823529, blue: 0, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9529411765, blue: 0.8509803922, alpha: 1)
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = fullScreenX * 0.05
        button.tag = 2
        return button
    }()
    
    let moreButton:UIButton = {
        let button = UIButton()
        button.setTitle("更多", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.cornerRadius = fullScreenX * 0.05
        button.tag = 3
        return button
    }()
    
    //MARK: -constraints
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addArrangedSubview(lightButton)
        addArrangedSubview(nightButton)
        addArrangedSubview(classicalButton)
        addArrangedSubview(moreButton)
        axis = .horizontal
        spacing = 30
        alignment = .fill
        distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
