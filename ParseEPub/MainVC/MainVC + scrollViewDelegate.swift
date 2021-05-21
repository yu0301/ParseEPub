//
//  MainVC + scrollViewDelegate.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/20.
//

import UIKit

extension MainVC:UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //判斷是否進入下個畫面
        //限定捲動模式觸發
        if pagingMode == "捲動"{
            let scrollHeightIndex = ((scrollView.contentOffset.y + scrollView.visibleSize.height + 47) / fullScreenY) - 1
            self.heightIndex = Int(scrollHeightIndex)
            //當前高度
            y = fullScreenY * CGFloat(heightIndex)
            bookMarkSet()
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //call下一頁
        //切換到下一頁時，立刻變成 self.heightIndex = 0
        
        let height = scrollView.contentOffset.y + 892
        let contenSizeHeight = scrollView.contentSize.height
        if height < 892 {
            self.heightIndex = 0
        }
        if height > contenSizeHeight{
            self.chapterIndex += 1
            loadHTML(chapterIndex: chapterIndex, heightIndex: 0 )
            bookMarkSet()
        }else if height < 845 && chapterIndex != 0{
            self.chapterIndex -= 1
            loadHTML(chapterIndex: chapterIndex, heightIndex: 0 )
            bookMarkSet()
        }
    }
}
