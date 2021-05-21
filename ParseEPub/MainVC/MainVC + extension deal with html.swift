//
//  MainVC + extension deal with html.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/2/5.
//

import UIKit

extension MainVC{
    //MARK:- HTML轉碼
    func dealHtml(index:Int)->String{
        let path = (epubParser?.opfURL!.appendingPathComponent(contentTextHref![index]).path)!
        //拿到路徑的檔案，解出內容可以在內容插入各類參數進行調整
        guard let html = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {
            return ""
        }
        return html
    }
    
    //MARK: - CSS轉碼
//    func getCSS()->String{
//        guard let css = try? String(contentsOfFile: css, encoding: String.Encoding.utf8) else {
//            return ""
//        }
//        return css
//    }
    
    //MARK:-載入畫面
//    device-width
//    document.body.scrollHeight
    func loadHTML(chapterIndex:Int,heightIndex:Int){
        //加入某頁面高度的heightIndex
        mainView.bookWebView.loadHTML(fromString: dealHtml(index: chapterIndex),backgroundColor: backGroundColor, fontSize: textSize,lineHeight: textSpacing,border: border)
    }
}
