//
//  EditCollectionView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/18.
//

import UIKit

class UnderLineEditCV:UICollectionView{
    
    var isSelectedColor:CircleColor.ChooseColor!
    var underLineData:[UnderLineData]!
    var passSelectedColor:((UIColor)->Void)?
    var passContent:((String)->Void)?
    
    //傳顏色進來，用顏色判斷該格是否被點選
    var colorArray:[CircleColor.ChooseColor] = [.red,.green,.purple,.yellow]
    var isSlected:[Bool] = [false,false,false,false]
    
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
        self.delegate = self
        self.dataSource = self
        backgroundColor = .white
    }
    //改成color
    convenience init(underLineData:[UnderLineData]) {
        self.init()
        self.isSelectedColor = underLineData[0].underLineColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UnderLineEditCV:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //傳送顏色給前面的vc，變色
        let color = colorArray[indexPath.row].color
        passSelectedColor!(color)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "bookMarksCVCell", for: indexPath) as! BookMarksCVCell
        cell.bookMarkColorButton.backgroundColor = colorArray[indexPath.row].color
//        cell.isSelected = isSlected[indexPath.row]
        //不適用第二路徑
//        (cell.bookMarkColorButton.backgroundColor == isSelectedColor.color) ? (cell.isSelected = true) : (cell.isSelected = false)
        
        switch indexPath.row{
        case 0:
            cell.pinImageView.isHidden = true
        case 1...colorArray.count:
            break
        default:
            fatalError()
        }
        return cell
    }
}
