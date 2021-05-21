//
//  SideMenuCVCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/13.
//

import UIKit

class SideMenuCVCell: UICollectionViewCell {
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "測試"
        return label
    }()
    
    let indicatorView:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    //MARK:- constraints
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setIndictorViewConstraints(){
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorView.widthAnchor.constraint(equalTo: widthAnchor),
            indicatorView.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.1),
            indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
    
    override var isSelected: Bool{
        didSet{
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0) {
                    self.indicatorView.backgroundColor = self.isSelected ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : UIColor.clear
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(indicatorView)
        setTitleLabelConstraints()
        setIndictorViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
