//
//  ColorButtonStackView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class ColorButtonStackView: UIStackView {

    //didSet
    let mixButton = ButtonFactory.makeButton(buttoncolor: .mix)
    let blueButton = ButtonFactory.makeButton(buttoncolor: .blue)
    let redButton = ButtonFactory.makeButton(buttoncolor: .red)
    let yellowButton = ButtonFactory.makeButton(buttoncolor: .yellow)
    let greenButton = ButtonFactory.makeButton(buttoncolor: .milkGreen)
    let purpleButton = ButtonFactory.makeButton(buttoncolor: .purple)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addArrangedSubview(mixButton)
        addArrangedSubview(blueButton)
        addArrangedSubview(redButton)
        addArrangedSubview(yellowButton)
        addArrangedSubview(greenButton)
        addArrangedSubview(purpleButton)
        axis = .horizontal
        spacing = 10
        alignment = .fill
        distribution = .fillEqually
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
