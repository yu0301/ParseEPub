//
//  MainVC + setParameter.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/10.
//

import Foundation

extension MainVC:GotoSideMenu{
    func setGoToSideMenu() {
        sideMainVC.modalPresentationStyle = .overCurrentContext
        presentMenu()
        present(sideMainVC, animated: false, completion: nil)
    }
}

//present到fontVC
extension MainVC:SetFontParameter{
    func setFontParameter() {
        state = .fontEdit
        fontVC.modalPresentationStyle = .overCurrentContext
        presentMenu()
        present(fontVC, animated: true, completion: nil)
    }
}

//present到backgroundVC
extension MainVC:SetBackGround{
    func setBackGround() {
        state = .backGroundColor
        presentMenu()
        backGroundVC.modalPresentationStyle = .overCurrentContext
        present(backGroundVC, animated: true, completion: nil)
    }
}

extension MainVC:GoToSelectedChapter{
    func goToSelectedChapter(chapterIndex: Int) {
        self.chapterIndex = chapterIndex
        loadHTML(chapterIndex: chapterIndex, heightIndex: 0)
        bookMarkSet()
    }
}
