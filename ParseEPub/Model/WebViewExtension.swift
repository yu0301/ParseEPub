//
//  WebViewExtension.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/10.
//

import Foundation
import WebKit

extension WKWebView {
    
    func loadHTML(fromString: String, fontColor: String = "#120101", backgroundColor:String = "#FFD382",fontFamily: String = "Gotham-Book", fontSize: String = "20",lineHeight:String = "130%",border:String = "80") {
        //把內文包進去，外面設置參數
        //載入原本的css，然後再另外設置字體、字體顏色、背景顏色、文字大小(寫enum包起來)
//        stylesheet.css
        //css應該載入該檔案的css
        let htmlString = """
                <link rel="stylesheet" type="text/css" href="stylesheet.css">
                <div style="background-color:\(backgroundColor);padding:10 \(border);margin-bottom:5px;">
                <div style="font-family: '\(fontFamily)'; font-weight: normal; font-size: \(fontSize); line-height: \(lineHeight) ; color: \(fontColor)">\(fromString)
                </div>
                """
        
        self.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
    }
}


