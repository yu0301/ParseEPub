//
//  ButtonFactory.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class ButtonFactory{
    static func makeButton(buttoncolor:Color) -> UIButton{
        let borderButton = UIButton()
        let circleView = UIView()
        borderButton.tag = 0
        circleView.isUserInteractionEnabled = false
        borderButton.addSubview(circleView)
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: borderButton.topAnchor,constant: 5),
            circleView.bottomAnchor.constraint(equalTo: borderButton.bottomAnchor,constant: -5),
            circleView.leadingAnchor.constraint(equalTo: borderButton.leadingAnchor,constant: 5),
            circleView.trailingAnchor.constraint(equalTo: borderButton.trailingAnchor,constant: -5)
        ])
        
        circleView.clipsToBounds = true
        //stackview - spacing / eachbutton's width - inset / 2
        circleView.layer.cornerRadius = (((fullScreenX * 0.72 - 50) / 6 ) - 10) / 2
        
        borderButton.clipsToBounds = true
        borderButton.layer.cornerRadius = (fullScreenX * 0.72 - 50) / 6 / 2
        borderButton.layer.borderWidth = 2
        borderButton.layer.borderColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        switch buttoncolor{
        case .mix:
            circleView.backgroundColor = #colorLiteral(red: 1, green: 0.4348993301, blue: 0, alpha: 1)
        case .blue:
            circleView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case .red:
            circleView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        case .yellow:
            circleView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case .milkGreen:
            circleView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        case .purple:
            circleView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
        
        return borderButton
    }
    
}

enum Color{
    case mix,blue,red,yellow,milkGreen,purple
}
