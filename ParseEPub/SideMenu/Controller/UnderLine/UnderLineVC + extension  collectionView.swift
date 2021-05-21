//
//  UnderLineVC + extension  collectionView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/26.
//

import UIKit

extension UnderLineVC:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return underLineTableView.headerView.colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //每次點選都要重新載入一次，再從中過濾
        underLineTableView.underLineDataArray = UserDefaultData.loadUnderLineData()
        
        //更改當前顏色，此顏色為每次進來vc時判斷要顯示什麼顏色，例如紅色的話只顯示紅色的內容
        circleColor = underLineTableView.headerView.colorArray[indexPath.row]
        
        //被選中的顏色
        let selectedColor = underLineTableView.headerView.colorArray[indexPath.row]
        
        //all就原本的array重排，其他挑出被選中顏色的元素，
        if selectedColor == .allColor{
            print("allColor")
        }else{
            underLineTableView.underLineDataArray = underLineTableView.underLineDataArray.filter{
                $0.underLineColor == selectedColor
            }
        }
        
        switch underLineTableView.underLineRank{
        
        case .newTimeToOldTime:
            underLineTableView.underLineDataArray = underLineTableView.underLineDataArray.sorted {$0.time![0] > $1.time![0]}
        case .OldTimeToNewTime:
            underLineTableView.underLineDataArray = underLineTableView.underLineDataArray.sorted {$0.time![0] < $1.time![0]}
        case .FrontChapterToBackChapter:
            underLineTableView.underLineDataArray = underLineTableView.underLineDataArray.sorted {$0.chapterIndex! < $1.chapterIndex!}
        case .BackChapterToFrontChapter:
            underLineTableView.underLineDataArray = underLineTableView.underLineDataArray.sorted {$0.chapterIndex! > $1.chapterIndex!}
        }
        underLineTableView.reloadData()
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = underLineTableView.headerView.dequeueReusableCell(withReuseIdentifier: "underLineCVCell", for: indexPath) as! UnderLineCVCell
        cell.bookMarkColorButton.backgroundColor = underLineTableView.headerView.colorArray[indexPath.row].color
        
        switch indexPath.row{
        case 0:
            cell.pinImageView.isHidden = false
            cell.borderView.isHidden = true
            cell.isUserInteractionEnabled = false
        case 1...underLineTableView.headerView.colorArray.count:
            break
        default:
            fatalError()
        }
        return cell
    }
}
