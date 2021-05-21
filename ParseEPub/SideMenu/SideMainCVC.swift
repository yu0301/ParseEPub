//
//  SideMenuCVC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/13.
//

import UIKit

private let reuseIdentifier = "Cell"

class SideMainCVC: UICollectionViewController {

    let titleArray = ["目錄","書籤","劃線註記"]
    var pagingToThePageDelegate:PagingToThePage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(SideMenuCVCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pagingToThePageDelegate?.pagingToThePage(page: indexPath.row)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SideMenuCVCell
        cell.titleLabel.text = titleArray[indexPath.row]
        
        return cell
    }
}

protocol PagingToThePage{
    func pagingToThePage(page:Int)
}

