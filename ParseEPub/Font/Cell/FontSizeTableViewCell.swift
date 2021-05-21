//
//  FontTableViewCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/7.
//

import UIKit

class FontSizeTableViewCell: UITableViewCell {
    
    let minusButton:UIButton = {
        let button = UIButton()
        button.setTitle("一嚶嚶嚶嚶嚶ㄥ", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = fullScreenY * 0.01
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    let plusButton:UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = fullScreenY * 0.01
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    let closeButton:UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = fullScreenY * 0.01
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    let sparseButton:UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = fullScreenY * 0.01
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button
    }()
    
    //MARK: - constraint
    
    func setMinusButtonConstraints(){
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.widthAnchor.constraint(equalToConstant: fullScreenX * 0.35).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: fullScreenY * 0.085).isActive = true
        minusButton.topAnchor.constraint(equalTo: topAnchor,constant:fullScreenY * 0.01 ).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant:fullScreenX * 0.1 ).isActive = true
    }
    
    func setPlusButtonConstraints(){
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.widthAnchor.constraint(equalToConstant: fullScreenX * 0.35).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: fullScreenY * 0.085).isActive = true
        plusButton.topAnchor.constraint(equalTo: topAnchor,constant:fullScreenY * 0.01 ).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor,constant:fullScreenX * 0.1 ).isActive = true
    }
    
    func setCloseButtonConstraints(){
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: fullScreenX * 0.35).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: fullScreenY * 0.085).isActive = true
        closeButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor,constant:fullScreenY * 0.01 ).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant:fullScreenX * 0.1 ).isActive = true
    }
    
    func setSparseButtonConstraints(){
        sparseButton.translatesAutoresizingMaskIntoConstraints = false
        sparseButton.widthAnchor.constraint(equalToConstant: fullScreenX * 0.35).isActive = true
        sparseButton.heightAnchor.constraint(equalToConstant: fullScreenY * 0.085).isActive = true
        sparseButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor,constant:fullScreenY * 0.01 ).isActive = true
        sparseButton.leadingAnchor.constraint(equalTo: closeButton.trailingAnchor,constant:fullScreenX * 0.1 ).isActive = true
    }
    
    //MARK: - button action
    
    @objc func letTextBecomeSmall(){
        print(123)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        isUserInteractionEnabled = false
        addSubview(minusButton)
        addSubview(plusButton)
        addSubview(closeButton)
        addSubview(sparseButton)
        setMinusButtonConstraints()
        setPlusButtonConstraints()
        setCloseButtonConstraints()
        setSparseButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
