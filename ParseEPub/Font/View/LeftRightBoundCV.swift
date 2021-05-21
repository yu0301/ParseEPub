//
//  LeftRightBoundCV.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/20.
//

import UIKit

class LeftRightBoundCV: UICollectionView {
    
    var passTextBorder : ((String) ->Void)?
    
    var model = TextFontRelated(){
        didSet{
            switch model.textBorder{
            case "30":
                selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .bottom)
            case "80":
                selectItem(at: IndexPath(item: 1, section: 0), animated: true, scrollPosition: .bottom)
            case "100":
                selectItem(at: IndexPath(item: 2, section: 0), animated: true, scrollPosition: .bottom)
            default:
                fatalError("no textBorder data")
            }
        }
    }
    
//    var boundaryViewModel:BoundaryViewModel{
//        return BoundaryViewModel(model: model)
//    }
    
    var makesTextBroadDelegate:ChangeTextBorder?
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = fullScreenX * 0.04
        layout.estimatedItemSize = CGSize(width: fullScreenX * 0.07, height: 95.0)
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
//        layout.itemSize = CGSize(width: fullScreenX * 0.1, height: fullScreenY * 0.1)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    func setTextBorder(_ border:String){
//        model.textBorder = border
//        UserDefaultData.saveFontData(fontData: model)
        
        //主頁拿到這頁的modelView
//        boundaryViewModel.textBorder.value = border
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(LeftRightBoundCVCell.self, forCellWithReuseIdentifier: "leftRightBoundCVCell")
        scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    convenience init(data:TextFontRelated) {
        self.init()
        self.model = data
    }
    
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LeftRightBoundCV:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "leftRightBoundCVCell", for: indexPath) as! LeftRightBoundCVCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            //傳到第一頁
            passTextBorder?("30")
        case 1:
            passTextBorder?("80")
        case 2:
            passTextBorder?("100")
        default:
            fatalError()
        }
    }
    
}
protocol ChangeTextBorder{
    func changeTextBroad(pandding:String)
}


