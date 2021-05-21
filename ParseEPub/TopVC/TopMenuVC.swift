//
//  TopBoardView.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/6.
//

import UIKit

class TopMenuVC: UIViewController {
    
    let topMenuView = TopMenuView()
    
    @objc func saveBookMarkPage(){
        //告訴主頁儲存資料
    }
    
    override func loadView() {
        view = topMenuView
    }
    
    override func viewDidLoad() {
//        topMenuView.bookMarkButton.addTarget(self, action: #selector(saveBookMarkPage), for: .touchUpInside)
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}


