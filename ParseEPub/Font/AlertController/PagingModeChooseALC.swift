//
//  PagingStyleChooseALC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/8.
//

import UIKit

class PagingModeChooseALC: UIAlertController {

    //PagingMode.mode
    var passPagingMode:((String)->Void)?
    
    func setAlertAction(){
        let one = UIAlertAction(title: "翻頁 - 單欄", style: .default) { [self] _ in
            passPagingMode!("翻頁")
        }
        let two = UIAlertAction(title: "捲動", style: .default) { [self]_ in
            passPagingMode!("捲動")
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        addAction(one)
        addAction(two)
        addAction(cancel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "翻頁模式"
        setAlertAction()
    }

}
