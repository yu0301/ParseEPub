//
//  LeftRightBoundCVCell.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/20.
//

import UIKit

class LeftRightBoundCVCell: UICollectionViewCell {
    
    
    var viewModel:BoundaryCellViewModel?
    var boundary:String?
    
    let boundImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "justify"))
        imageView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageView.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return imageView
    }()
    
    
    func setBoundButtonConstraints(){
        boundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            boundImageView.topAnchor.constraint(equalTo: topAnchor),
            boundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            boundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            boundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            boundImageView.heightAnchor.constraint(equalToConstant: fullScreenX * 0.07),
            boundImageView.widthAnchor.constraint(equalToConstant: fullScreenX * 0.07)
        ])    }
    
    override var isSelected: Bool{
        didSet{
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0) {
                    self.boundImageView.image = self.isSelected ? UIImage(named: "justifyBlack") : UIImage(named: "justify")
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(boundImageView)
        setBoundButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: BoundaryCellViewModel) {
        self.viewModel = viewModel
        
        viewModel.textBorder.binding { [weak self] value in
            DispatchQueue.main.async {
                self?.boundary = value
            }
        }
    }
}


