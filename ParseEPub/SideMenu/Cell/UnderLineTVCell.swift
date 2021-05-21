//
//  UnderLineTVCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class UnderLineTVCell: UITableViewCell {

    let rankImageView:UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "sort"))
        return imageView
    }()
    
    let rankLabel:UILabel = {
        let label = UILabel()
        label.text = "依時間 (新到舊)"
        return label
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
//        label.text = "三日前"
        label.textAlignment = .left
        return label
    }()
    
    let quoteImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "text.quote"))
        return imageView
    }()
    
    let annotationTextView:UITextView = {
       let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        textView.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textView.font = UIFont(name: "AppleSDGothicNeo-semiBold", size: 20)
        return textView
    }()
    
    let underLineContentView = UnderLineContenView()

    //右上
    lazy var underlineStackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shareButton,editButton,garbageButton])
        stackView.axis = .horizontal
        stackView.spacing = fullScreenX * 0.001
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    let shareButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return button
    }()
    
    let editButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return button
    }()
    
    let garbageButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return button
    }()
    //MARK:- constraints
   
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
    
    func setDateLabelConstraints(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    func setQuoteImageViewConstraints(){
        quoteImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quoteImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            quoteImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            quoteImageView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.1),
            quoteImageView.heightAnchor.constraint(equalToConstant: fullScreenX * 0.1)
        ])
    }
    
    func setAnnotationTextViewConstraints(){
        annotationTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            annotationTextView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
//            annotationTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            annotationTextView.leadingAnchor.constraint(equalTo: quoteImageView.trailingAnchor),
            annotationTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setUnderLineContentViewConstraints(){
        underLineContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underLineContentView.topAnchor.constraint(equalTo:annotationTextView.bottomAnchor),
            underLineContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            underLineContentView.leadingAnchor.constraint(equalTo: quoteImageView.trailingAnchor),
            underLineContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
    
    func setUnerlineStackViewConstraints(){
        underlineStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underlineStackView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.351),
            underlineStackView.heightAnchor.constraint(equalToConstant: fullScreenX * 0.351),
            underlineStackView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            underlineStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: fullScreenX * -0.035)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(rankImageView)
        contentView.addSubview(rankLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(quoteImageView)
        contentView.addSubview(annotationTextView)
        contentView.addSubview(underlineStackView)
        contentView.addSubview(underLineContentView)
        setRankImageViewConstraints()
        setRankLabelConstraints()
        setDateLabelConstraints()
        setQuoteImageViewConstraints()
        setAnnotationTextViewConstraints()
        setUnerlineStackViewConstraints()
        setUnderLineContentViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
