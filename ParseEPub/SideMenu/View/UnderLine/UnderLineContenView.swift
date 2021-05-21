//
//  UnderLineContenView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/26.
//

import UIKit

class UnderLineContenView: UIView {

    let sideView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return view
    }()
    
    let contentLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: -constraint
    
    func setSideViewConstraints(){
        sideView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sideView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sideView.topAnchor.constraint(equalTo: topAnchor),
            sideView.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.01),
            sideView.heightAnchor.constraint(equalTo: contentLabel.heightAnchor)
        ])
    }
    
    func setContentLableConstraints(){
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: sideView.trailingAnchor,constant: 5),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentLabel.topAnchor.constraint(equalTo: topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentLabel)
        addSubview(sideView)
        setContentLableConstraints()
        setSideViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
