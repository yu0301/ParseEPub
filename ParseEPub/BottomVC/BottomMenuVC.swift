//
//  BottomBoard.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/6.
//

import UIKit

class BottomMenuVC: UIViewController {
    
    var setFontParameterDelegate:SetFontParameter?
    var setBackGroundDelegate:SetBackGround?
    var gotoSideMenuDelegate:GotoSideMenu?
    lazy var bottomMenuView = BottomMenuView(pages: self.pages)
    var pages:Double!

    //MARK:- button action
    //通知mainVC present到目標頁面
    
    @objc func goToFontSet(){
        setFontParameterDelegate?.setFontParameter()
    }
    
    @objc func goToBackGroundSet(){
        setBackGroundDelegate?.setBackGround()
    }
    
    @objc func goToSideMenu(){
        gotoSideMenuDelegate?.setGoToSideMenu()
    }
    
    
    override func loadView() {
        view = bottomMenuView
    }
    
    //如果button action是present到某一頁面，則邏輯寫在該vc會比較好
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomMenuView.stackView.fontButton.addTarget(self, action: #selector(goToFontSet), for: .touchUpInside)
        bottomMenuView.stackView.backGroundButton.addTarget(self, action: #selector(goToBackGroundSet), for: .touchUpInside)
        bottomMenuView.stackView.menuButton.addTarget(self, action: #selector(goToSideMenu), for: .touchUpInside)
    }
    
    convenience init(pages:Double) {
        self.init()
        self.pages = pages
    }
}

protocol SetFontParameter {
    func setFontParameter()
}

protocol SetBackGround{
    func setBackGround()
}

protocol GotoSideMenu{
    func setGoToSideMenu()
}
