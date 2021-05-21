//
//  BookMarksHeader.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class BookMarksHeader: UIView {
    
    let pinImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "pin"))
        imageView.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return imageView
    }()
    
    let bookMarkHeaderCV = BookMarkHeaderCV()
    
    //stakview
//    let colorButtonStackView = ColorButtonStackView()
    
    //MARK:- constraints
    
    func setPinImageViewConstraints(){
        pinImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pinImageView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.08),
            pinImageView.heightAnchor.constraint(equalToConstant: fullScreenX * 0.08),
            pinImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pinImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
//    func setColorButtonStackViewConstraints(){
//        colorButtonStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            colorButtonStackView.topAnchor.constraint(equalTo: topAnchor),
//            colorButtonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            colorButtonStackView.leadingAnchor.constraint(equalTo: pinImageView.trailingAnchor),
//            colorButtonStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
//
//        ])
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pinImageView)
//        addSubview(colorButtonStackView)
        setPinImageViewConstraints()
//        setColorButtonStackViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
