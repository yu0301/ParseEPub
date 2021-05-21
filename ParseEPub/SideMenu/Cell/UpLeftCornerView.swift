//
//  UpLeftCornerView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/16.
//

import UIKit

class UpLeftCornerView: UIView {
    
    let phoneImage:UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "iphone.homebutton"))
        imageView.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return imageView
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.text = "3日前"
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-semiBold", size: 15)
        return label
    }()
    
    let chapterTitleLabel:UILabel = {
        let label = UILabel()
//        label.text = "鴨子兩條腿"
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = UIFont(name: "AppleSDGothicNeo-semiBold", size: 15)
        return label
    }()
    
    let bookMarkImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "bookmark.fill"))
        return imageView
    }()
    
    //MARK:- constraints
    
    func setPhoneButtonConstraints(){
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneImage.widthAnchor.constraint(equalToConstant: fullScreenX * 0.05),
            phoneImage.heightAnchor.constraint(equalToConstant: fullScreenX * 0.05),
            phoneImage.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    func setDateLabelConstraints(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.centerYAnchor.constraint(equalTo: phoneImage.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor,constant: fullScreenX * 0.01)
        ])
    }
    
    func setChaptitleLabelConstraints(){
        chapterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chapterTitleLabel.topAnchor.constraint(equalTo: phoneImage.bottomAnchor,constant: fullScreenX * 0.01)
        ])
    }
    
    func setBookMarkImageViewConstraints(){
        bookMarkImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookMarkImageView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.05),
            bookMarkImageView.heightAnchor.constraint(equalToConstant: fullScreenX * 0.05),
            bookMarkImageView.topAnchor.constraint(equalTo: chapterTitleLabel.bottomAnchor,constant: fullScreenX * 0.01)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
        addSubview(phoneImage)
        addSubview(chapterTitleLabel)
        addSubview(dateLabel)
        addSubview(bookMarkImageView)
        setPhoneButtonConstraints()
        setChaptitleLabelConstraints()
        setDateLabelConstraints()
        setBookMarkImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
