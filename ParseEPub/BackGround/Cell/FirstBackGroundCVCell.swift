//
//  FirstBackGroundCVCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/22.
//

import UIKit

class FirstBackGroundCVCell: UICollectionViewCell {
    
    var colorHex = ""
    var colorLightIndex:Float!
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.layer.cornerRadius = fullScreenY * 0.025
        return label
    }()
    
    let shadowView:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = fullScreenY * 0.025
        return view
    }()
    
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: fullScreenX * 0.17),
            titleLabel.heightAnchor.constraint(equalToConstant: fullScreenY * 0.05),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setShadowViewConstraints(){
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.19),
            shadowView.heightAnchor.constraint(equalToConstant: fullScreenY * 0.06),
            shadowView.centerXAnchor.constraint(equalTo: centerXAnchor),
            shadowView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override var isSelected: Bool{
        didSet{
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0) {
                    self.shadowView.backgroundColor = self.isSelected ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : UIColor.clear
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
//        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubview(shadowView)
        addSubview(titleLabel)
        setShadowViewConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
