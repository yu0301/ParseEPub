//
//  BottomView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/24.
//

import UIKit

class BottomMenuView: UIView {
    
    let pageSlider:UISlider = {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 1
        slider.isContinuous = true
        return slider
    }()
    
    let stackView:BottonStackView = BottonStackView()
    
    let pageLabel:UILabel = {
        let label = UILabel()
        label.text = "第1頁/共20頁"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.numberOfLines = 0
        return label
    }()
    
    
    //MARK: - constraints
    
    func setPageSliderConstraints(){
        pageSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageSlider.topAnchor.constraint(equalTo: topAnchor),
            pageSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageSlider.widthAnchor.constraint(equalTo: widthAnchor),
            pageSlider.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.1)
        ])
    }
    
    func setStackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.33),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setPageLabelConstaints(){
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            pageLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        addSubview(pageSlider)
        addSubview(stackView)
        addSubview(pageLabel)
        setStackViewConstraints()
        setPageLabelConstaints()
        setPageSliderConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(pages:Double) {
        self.init()
        self.pageLabel.text = "第1頁/共\(pages)頁"
    }
}
