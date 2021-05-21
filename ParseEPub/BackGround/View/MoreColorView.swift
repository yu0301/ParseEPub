//
//  MoreColorView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/11.
//

import UIKit

class MoreColorView: UIView {
    
    let baseView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = fullScreenX * 0.03
        return view
    }()

    lazy var secondBackGroundCV = SecondBackGroundCV(data: data)
    var data:TextFontRelated!

    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "更多主題色"
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        return label
    }()
    
    //MARK: -constraints
    
    func setBaseViewConstraints(){
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.8).isActive = true
        baseView.heightAnchor.constraint(equalToConstant: fullScreenY * 0.25).isActive = true
        baseView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        baseView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: fullScreenY * 0.05).isActive = true
        titleLabel.topAnchor.constraint(equalTo: baseView.topAnchor,constant: fullScreenY * 0.02).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setSecondBackGroundCV(){
        secondBackGroundCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondBackGroundCV.heightAnchor.constraint(equalToConstant: fullScreenY * 0.15),
            secondBackGroundCV.widthAnchor.constraint(equalToConstant: fullScreenX * 0.8),
            secondBackGroundCV.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            secondBackGroundCV.bottomAnchor.constraint(equalTo: baseView.bottomAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(baseView)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        baseView.addSubview(titleLabel)
//        baseView.addSubview(secondBackGroundCV)
        setBaseViewConstraints()
        setTitleLabelConstraints()
//        setSecondBackGroundCV()
        isHidden = true
    }
    
    convenience init(data:TextFontRelated) {
        self.init()
        self.data = data
        baseView.addSubview(secondBackGroundCV)
        setSecondBackGroundCV()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


