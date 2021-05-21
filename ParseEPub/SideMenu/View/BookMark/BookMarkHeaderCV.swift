//
//  BookMarkHeaderCV.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class BookMarkHeaderCV: UICollectionView {
    
    var isSelectedColor:CircleColor.ChooseColor!
    var underLineData:[UnderLineData]!
    var passSelectedColor:((UIColor)->Void)?
    
    //傳顏色進來，用顏色判斷該格是否被點選
    var colorArray:[CircleColor.ChooseColor] = [.white,.allColor,.blue,.red,.yellow,.green,.purple]
    var isSlected:[Bool] = [false,false,false,false,false]
    
    enum State{
        case header,edit
    }
    
    var state:State?

    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: fullScreenY * 0.05, height: fullScreenY * 0.05)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,collectionViewLayout: self.layout)
        self.register(BookMarksCVCell.self, forCellWithReuseIdentifier: "bookMarksCVCell")
//        self.delegate = self
//        self.dataSource = self
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
