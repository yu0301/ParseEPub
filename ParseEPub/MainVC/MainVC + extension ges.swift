//
//  MainVC + extension ges.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/2/5.
//

import UIKit
import MenuItemKit

extension MainVC{
    //MARK: - gesture action
    @objc func goToNextPage(){
        let tapPoint = pagingGesture.location(in: nil)
        let width = UIScreen.main.bounds.size.width
        let leftPoint = CGPoint(x: width * 0.33, y: 0)
        let rightPoint = CGPoint(x: width * 0.66, y: 0)
        //點擊範圍小於右點則往前翻
        //當前y位置為負數再往前則跳章節，如果allPageHeight - y > y則會超過則下一張
        if tapPoint.x > rightPoint.x {
            self.heightIndex += 1
            y = visableHeight * CGFloat(heightIndex)
            if ((allPageHeight.height - y) > 30) == true{
                print(allPageHeight.height - y)
                mainView.bookWebView.scrollView.setContentOffset(CGPoint(x: 0, y: y), animated: false)
                bookMarkSet()
            }else{
                //index 歸零
                //跳到下一頁
                self.heightIndex = 0
                self.chapterIndex += 1
                loadHTML(chapterIndex: chapterIndex, heightIndex: 0 )
                bookMarkSet()
            }
            //點擊範圍小於右點則往後翻
        }else if tapPoint.x < leftPoint.x {
            if heightIndex != 0{
                self.heightIndex -= 1
                y = fullScreenY * CGFloat(heightIndex)
                mainView.bookWebView.scrollView.setContentOffset(CGPoint(x: 0, y: y), animated: false)
                bookMarkSet()
            }else if self.chapterIndex != 0{
                self.chapterIndex -= 1
                loadHTML(chapterIndex: chapterIndex, heightIndex: 0 )
                bookMarkSet()
            //跳上一章節的最下面
            }
        }
    }
    
    //MARK: - menu
    @objc func menuPresent(){
        let tapPoint = menuGesture.location(in: nil)
        let width = UIScreen.main.bounds.size.width
        let leftPoint = CGPoint(x: width * 0.33, y: 0)
        let rightPoint = CGPoint(x: width * 0.66, y: 0)
        if  tapPoint.x > leftPoint.x && tapPoint.x < rightPoint.x{
            presentMenu()
        }
    }
    
    //MARK: - bookmarkgesture action
    
    @objc func normalTap(_ sender:UITapGestureRecognizer){
        //變色並且記錄當前的chapterindedex and heightIndex
        let tintColor = sender.view!.tintColor
        
        if tintColor == #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1){
            time = Date().timeArray
            mainView.bookMarkButton.image = UIImage(systemName: "bookmark.fill")
            mainView.bookMarkButton.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            topViewVC.topMenuView.bookMarkButton.image = UIImage(systemName: "bookmark.fill")
            topViewVC.topMenuView.bookMarkButton.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            bookMarkData.append(BookMarkData(time:self.time,bookMarkColor:QuoteColor(uiColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)),bookMarkTitle: self.bookMarkTitle,state:.create,chapterIndex: self.chapterIndex, heightIndex: self.heightIndex))
            //通知tableview reloaddata
        }else{
            //把被取消的頁面拿掉
            bookMarkData = bookMarkData.filter { (data) -> Bool in
                data.chapterIndex != self.chapterIndex || data.heightIndex != self.heightIndex
            }
            
            mainView.bookMarkButton.image = UIImage(systemName: "bookmark")
            mainView.bookMarkButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            topViewVC.topMenuView.bookMarkButton.image = UIImage(systemName: "bookmark")
            topViewVC.topMenuView.bookMarkButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            //通知tableview reloaddata
        }
    }
    
    //main vc設定
    @objc func longTap(){
        let color = mainView.bookMarkButton.tintColor
        if color != #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1){
            //拿當前資料進去
            //進入編輯模式
            let tag = self.bookMarkData.count - 1
            let vc = BookMarkEditVC(bookMarkDataArray: self.bookMarkData, bookMarkData: nil, tag: tag)
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        }
    }

    //MARK: - 面板觸發
    func presentMenu(){
        if state == .normal {
            state = .menu
            UIView.animate(withDuration: 0.2) { [self] in
                topViewVC.view.frame = CGRect(x: 0, y: 0, width: fullScreenX, height: fullScreenY * 0.2)
                bottomVC.view.frame = CGRect(x: 0, y: fullScreenY * 0.8, width: fullScreenX, height: fullScreenY * 0.2)
            }
        }else if state == .menu || state == .fontEdit {
            state = .normal
            UIView.animate(withDuration: 0.2) { [self] in
                topViewVC.view.frame = CGRect(x: 0, y: -fullScreenY * 0.2, width: fullScreenX, height: fullScreenY * 0.2)
                bottomVC.view.frame = CGRect(x: 0, y: fullScreenY, width: fullScreenX, height: fullScreenY * 0.2)
            }
        }else if state == .backGroundColor{
            state = .normal
            UIView.animate(withDuration: 0.2) { [self] in
                topViewVC.view.frame = CGRect(x: 0, y: -fullScreenY * 0.2, width: fullScreenX, height: fullScreenY * 0.2)
                bottomVC.view.frame = CGRect(x: 0, y: fullScreenY, width: fullScreenX, height: fullScreenY * 0.2)
                // backGroundVC.view.frame = CGRect(x: 0, y: 0, width: fullScreenX, height: fullScreenY)
            }
        }else if state == .allHidden{
            state = .normal
            UIView.animate(withDuration: 0.2) { [self] in
                backGroundVC.view.frame = CGRect(x: 0, y: fullScreenY  , width: fullScreenX, height: fullScreenY * 0.5 )
            }
        }
    }
    
    //MARK:-手勢
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
