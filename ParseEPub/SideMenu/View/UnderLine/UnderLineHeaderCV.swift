//
//  UnderLineCV.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit
//和editcollectionview合併
class UnderLineHeaderCV: UICollectionView {

    let colorArray:[CircleColor.ChooseColor] = [.white,.allColor,.red,.yellow,.green,.purple]
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: fullScreenY * 0.05, height: fullScreenY * 0.05)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,collectionViewLayout: self.layout)
        self.register(UnderLineCVCell.self, forCellWithReuseIdentifier: "underLineCVCell")
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

