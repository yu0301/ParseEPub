//
//  TopMenuView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/29.
//

import UIKit

//本頁跑出時，mainvc要傳布林值進來
class TopMenuView: UIView {

    let bookcaseButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.setTitle("書櫃", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button
    }()
    
    let seatchButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button
    }()
    
    let bookMarkButton:UIImageView = {
        let button = UIImageView(image: UIImage(systemName: "bookmark"))
        button.isUserInteractionEnabled = true
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button
    }()
    
    //MARK:- 手勢
    let tapGesture:UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.numberOfTapsRequired = 1
        return tapGesture
    }()
    
    let longGesture:UILongPressGestureRecognizer = {
        let tapGesture = UILongPressGestureRecognizer()
        return tapGesture
    }()
    
    @objc func normalTap(){
        
    }
    
    @objc func longTap(){
        print(333)
    }
    
    //MARK:- constraints
    
    func setBookcaseConstraints(){
        bookcaseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            bookcaseButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookcaseButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setSeatchButtonConstraints(){
        seatchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seatchButton.trailingAnchor.constraint(equalTo: bookMarkButton.leadingAnchor),
            seatchButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setBookMarkConstraints(){
        bookMarkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookMarkButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookMarkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            bookMarkButton.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.15),
            bookMarkButton.heightAnchor.constraint(equalTo: widthAnchor,multiplier: 0.15)
        ])
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bookcaseButton)
        setBookcaseConstraints()
        
        addSubview(bookMarkButton)
        setBookMarkConstraints()
        
//        addSubview(seatchButton)
//        setSeatchButtonConstraints()
        
        bookMarkButton.addGestureRecognizer(tapGesture)
        bookMarkButton.addGestureRecognizer(longGesture)
        
        tapGesture.addTarget(self, action: #selector(normalTap))
        longGesture.addTarget(self, action: #selector(longTap))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
