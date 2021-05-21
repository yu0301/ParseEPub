//
//  BoundaryTableViewCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/7.
//

import UIKit

class BoundaryTableViewCell: UITableViewCell {

    var model = TextFontRelated(){
        didSet{
            leftRightBoundCV.model = model
        }
    }
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "左右邊界"
        label.font =  UIFont(name: "AppleSDGothicNeo-semiBold", size: 25)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        return label
    }()

    let containerView = UIView()
    lazy var leftRightBoundCV = LeftRightBoundCV()

    func setLeftRightBoundCV(model:TextFontRelated){
        print("cell border \(model.textBorder)")
        leftRightBoundCV.model = model
    }
    
    //MARK:- constraints
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: fullScreenX * 0.05).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setContainerViewConstaints(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.29),
            containerView.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: fullScreenX * -0.04),
            containerView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    func setLeftRightBoundCVConstraints(){
        leftRightBoundCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftRightBoundCV.topAnchor.constraint(equalTo: containerView.topAnchor),
            leftRightBoundCV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            leftRightBoundCV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            leftRightBoundCV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(containerView)
        containerView.addSubview(leftRightBoundCV)
        setTitleLabelConstraints()
        setContainerViewConstaints()
        setLeftRightBoundCVConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
