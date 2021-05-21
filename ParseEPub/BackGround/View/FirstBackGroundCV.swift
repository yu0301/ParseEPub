//
//  FirsrBackGroundCV.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/22.
//

import UIKit

class FirstBackGroundCV: UICollectionView {
    
    //顏色應該要經過slider的參數計算
    let colorHexArray = ["#ffffff","#000000","#faf2d9",""]
    let titleArray = ["明亮","夜間","復古","更多"]
    let titleColorArray = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
    let titleBKColorArray = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.9803921569, green: 0.9529411765, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    var data:TextFontRelated!
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: fullScreenX * 0.2, height: fullScreenY * 0.13)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        backgroundColor = .clear
        dataSource = self
        register(FirstBackGroundCVCell.self, forCellWithReuseIdentifier: "firstBackGroundCVCell")
    }
    
    convenience init(data:TextFontRelated) {
        self.init()
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstBackGroundCV:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: "firstBackGroundCVCell", for: indexPath) as! FirstBackGroundCVCell
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.titleLabel.textColor = titleColorArray[indexPath.row]
        cell.titleLabel.backgroundColor = titleBKColorArray[indexPath.row]
        cell.titleLabel.layer.borderColor = titleColorArray[indexPath.row].cgColor
        cell.colorHex = colorHexArray[indexPath.row]
        switch indexPath.row{
        case 0...2:
            cell.colorLightIndex = data.colorLightIndex
        case 3:
            cell.shadowView.isHidden = true
        default:
            fatalError()
        }
        
        return cell
    }
}
