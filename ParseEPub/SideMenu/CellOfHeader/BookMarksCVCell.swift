//
//  BookMarksCVCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class BookMarksCVCell: UICollectionViewCell {
    
    let pinImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "pin"))
        imageView.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        imageView.isHidden = true
        return imageView
    }()
    
    let bookMarkColorButton:UIView = {
        let button = UIView()
        button.clipsToBounds = true
        button.layer.cornerRadius = fullScreenY * 0.0125
        return button
    }()
    
    let borderView:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = fullScreenY * 0.0175
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.clear.cgColor
        return view
    }()
    
    //MARK: -constraints
    
    func setBookMarkColorButtonConstraints(){
        bookMarkColorButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookMarkColorButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            bookMarkColorButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            bookMarkColorButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            bookMarkColorButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setBookMarkColorBorderViewConstraints(){
        borderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            borderView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            borderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            borderView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setPinImageViewConstraints(){
        pinImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pinImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            pinImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            pinImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pinImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override var isSelected: Bool{
        didSet{
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0) {
                    self.borderView.layer.borderColor = self.isSelected ? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) : UIColor.clear.cgColor
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(borderView)
        addSubview(bookMarkColorButton)
        addSubview(pinImageView)
        setBookMarkColorBorderViewConstraints()
        setBookMarkColorButtonConstraints()
        setPinImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
