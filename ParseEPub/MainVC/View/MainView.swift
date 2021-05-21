//
//  MainView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/12.
//

import UIKit

class MainView: UIView {

    lazy var bookWebView = BookWKWebView(color: underLineColor)
    var underLineColor:CircleColor.ChooseColor = .red
    var backGroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0){
        didSet{
            backgroundColor = backGroundColor
            titleLabel.backgroundColor = backGroundColor
            bookWebView.backgroundColor = backGroundColor
            bookWebView.scrollView.backgroundColor = backGroundColor
        }
    }
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "標題"
        return label
    }()
    
    let bookMarkButton:UIImageView = {
        let button = UIImageView(image: UIImage(systemName: "bookmark"))
        button.isUserInteractionEnabled = true
        button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return button
    }()
    //MARK:- constraints
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func setBookMarkConstraints(){
        bookMarkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookMarkButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookMarkButton.topAnchor.constraint(equalTo: topAnchor,constant: fullScreenY * 0.1),
            bookMarkButton.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.15),
            bookMarkButton.heightAnchor.constraint(equalTo: widthAnchor,multiplier: 0.15)
        ])
    }
    
    func setBookWKWebViewConstraints(){
        bookWebView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookWebView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            bookWebView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bookWebView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookWebView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(bookWebView)
        addSubview(bookMarkButton)
        setTitleLabelConstraints()
        setBookWKWebViewConstraints()
        setBookMarkConstraints()
    }
    
    //書籤要拿到資料判斷是否有無bookmark
    convenience init(color:CircleColor.ChooseColor,chapterTitle:String,backGroundColor:UIColor) {
        self.init()
        self.underLineColor = color
        self.titleLabel.text = chapterTitle
        self.backGroundColor = backGroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
