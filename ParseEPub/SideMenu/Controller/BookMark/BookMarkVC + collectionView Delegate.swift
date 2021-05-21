//
//  BookMarkVC + collectionView Delegate.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/13.
//

import UIKit

extension BookMarkVC:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookMarkTableView.headerView.colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //每次點選都要重新載入一次，再從中過濾
        bookMarkTableView.bookMarkData = UserDefaultData.loadBookMarkData()
        
        //更改當前顏色，此顏色為每次進來vc時判斷要顯示什麼顏色，例如紅色的話只顯示紅色的內容
        circleColor = bookMarkTableView.headerView.colorArray[indexPath.row]
        
        //被選中的顏色
        let selectedColor = bookMarkTableView.headerView.colorArray[indexPath.row]
        
        //all就原本的array重排，其他挑出被選中顏色的元素，
        if selectedColor == .allColor{
            print("allColor")
        }else{
            bookMarkTableView.bookMarkData = bookMarkTableView.bookMarkData.filter{
                $0.bookMarkColor?.uiColor == selectedColor.color
            }
        }
        
        //顏色挑出來之後再按照要求去排列
        switch bookMarkTableView.bookMarkRank{
        case .newTimeToOldTime:
            bookMarkTableView.bookMarkData = bookMarkTableView.bookMarkData.sorted {$0.time![0] > $1.time![0]}
        case .OldTimeToNewTime:
            bookMarkTableView.bookMarkData = bookMarkTableView.bookMarkData.sorted {$0.time![0] < $1.time![0]}
        case .FrontChapterToBackChapter:
            bookMarkTableView.bookMarkData = bookMarkTableView.bookMarkData.sorted {$0.chapterIndex < $1.chapterIndex}
        case .BackChapterToFrontChapter:
            bookMarkTableView.bookMarkData = bookMarkTableView.bookMarkData.sorted {$0.chapterIndex > $1.chapterIndex}
        }
        bookMarkTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bookMarkTableView.headerView.dequeueReusableCell(withReuseIdentifier: "bookMarksCVCell", for: indexPath) as! BookMarksCVCell
        cell.bookMarkColorButton.backgroundColor = bookMarkTableView.headerView.colorArray[indexPath.row].color
        
        switch indexPath.row{
        case 0:
            cell.pinImageView.isHidden = false
            cell.borderView.isHidden = true
            cell.isUserInteractionEnabled = false
        case 1...bookMarkTableView.headerView.colorArray.count:
            break
        default:
            fatalError()
        }
        return cell
    }
}



