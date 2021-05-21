//
//  WebView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/25.
//

import UIKit
class WebView: UIWebView {


    //拿到網址
    
    
    
    //當收到點擊時可以didset改變網址
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
