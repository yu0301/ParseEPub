//
//  BookMarksTVCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class BookMarksTVCell: UITableViewCell {
    
    //MARK- for item 0
    let rankImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sort"))
        return imageView
    }()
    
    let rankLabel:UILabel = {
        let label = UILabel()
        label.text = "依時間 (新到舊)"
        label.numberOfLines = 0
        return label
    }()
    
    //MARK:- after item
    
    //左上
    let upLeftCornerView = UpLeftCornerView()
    
    //右上
    let editButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        return button
    }()
    
    let garbageButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        return button
    }()
    
    //下
    let chapterLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "鴨子兩條腿"
        return label
    }()
    
    let annotationTextView:UITextView = {
       let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        textView.font = UIFont(name: "AppleSDGothicNeo-semiBold", size: 20)
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return textView
    }()
    
    //MARK:- constraints
    
    //item0
    func setRankImageViewConstraints(){
        rankImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rankImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rankImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            rankImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
    
    func setRankLabelConstraints(){
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: rankImageView.trailingAnchor),
            rankLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    //after item 0
    func setUpLeftCornerViewConstraints(){
        upLeftCornerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upLeftCornerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            upLeftCornerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            upLeftCornerView.heightAnchor.constraint(equalToConstant: fullScreenY * 0.1),
            upLeftCornerView.widthAnchor.constraint(equalToConstant: fullScreenY * 0.2)
        ])
    }
    
    func setEditButtonConstraints(){
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.widthAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            editButton.heightAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            editButton.trailingAnchor.constraint(equalTo: garbageButton.leadingAnchor,constant: fullScreenX * -0.01)
        ])
    }
    
    func setGarbageButtonConstraints(){
        garbageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            garbageButton.widthAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            garbageButton.heightAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            garbageButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setChapterLabelConstraints(){
        chapterLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chapterLabel.topAnchor.constraint(equalTo: upLeftCornerView.bottomAnchor),
            chapterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: fullScreenX * 0.1),
        ])
    }
    
    func setAnnotationTextViewConstraints(){
        annotationTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            annotationTextView.topAnchor.constraint(equalTo: chapterLabel.bottomAnchor),
            annotationTextView.leadingAnchor.constraint(equalTo: chapterLabel.leadingAnchor),
            annotationTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            annotationTextView.heightAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            annotationTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(rankImageView)
        contentView.addSubview(rankLabel)
        contentView.addSubview(upLeftCornerView)
        contentView.addSubview(editButton)
        contentView.addSubview(garbageButton)
        contentView.addSubview(chapterLabel)
        contentView.addSubview(annotationTextView)
        setRankImageViewConstraints()
        setRankLabelConstraints()
        setUpLeftCornerViewConstraints()
        setGarbageButtonConstraints()
        setEditButtonConstraints()
        setChapterLabelConstraints()
        setAnnotationTextViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
