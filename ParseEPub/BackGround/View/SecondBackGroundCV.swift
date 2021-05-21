//
//  SecondBackGroundCV.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/22.
//

import UIKit

class SecondBackGroundCV: UICollectionView {
    let colorHexArray = ["#fafafa","#baf0ff","#575757","#e3ffeb","#b36200","#2e2e2e"]
    let titleArray = ["寧靜","冷色","深灰","奶綠","咖啡","黑板"]
    let titleColorArray = [#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    let titleBKColorArray = [#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1),#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
    var data:TextFontRelated!
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: fullScreenX * 0.24, height: fullScreenY * 0.06)
        layout.scrollDirection = .vertical
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        register(SecondBackGroundCVCell.self, forCellWithReuseIdentifier: "secondBackGroundCVCell")
        backgroundColor = .white
        dataSource = self
    }
    
    convenience init(data:TextFontRelated) {
        self.init()
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondBackGroundCV:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "secondBackGroundCVCell", for: indexPath) as! SecondBackGroundCVCell
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.titleLabel.textColor = titleColorArray[indexPath.row]
        cell.titleLabel.backgroundColor = titleBKColorArray[indexPath.row]
        cell.titleLabel.layer.borderColor = titleColorArray[indexPath.row].cgColor
        cell.colorHex = colorHexArray[indexPath.row]
        cell.colorLightIndex = data.colorLightIndex
        return cell
    }
}
