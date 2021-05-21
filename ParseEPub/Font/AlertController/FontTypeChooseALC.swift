//
//  FontTypeChooseALC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/8.
//

import UIKit

class FontTypeChooseALC: UIAlertController {
    
//    var returnSelectedFontDelegate:ReturnSelectedFont!
    var passFontStyle:((String)->Void)?
    func setAlertAction(){
        let one = UIAlertAction(title: "出版社字體", style: .default) { [self] _ in
            passFontStyle!("出版社字體")
        }
        let two = UIAlertAction(title: "華康青花黑體", style: .default) { [self]_ in
            passFontStyle!("華康青花黑體")
        }
        let three = UIAlertAction(title: "信黑體", style: .default) { [self]_ in
            passFontStyle!("信黑體")
        }
        let four = UIAlertAction(title: "華康明體", style: .default) { [self]_ in
            passFontStyle!("華康明體")
        }
        let five = UIAlertAction(title: "華康楷體", style: .default) { [self]_ in
            passFontStyle!("華康楷體")
        }
        let six = UIAlertAction(title: "華康仿宋體", style: .default) { [self]_ in
            passFontStyle!("華康仿宋體")
        }
        let seven = UIAlertAction(title: "思源宋體", style: .default) { [self]_ in
            passFontStyle!("思源宋體")
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        addAction(one)
        addAction(two)
        addAction(three)
        addAction(four)
        addAction(five)
        addAction(six)
        addAction(seven)
        addAction(cancel)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "字體"
        setAlertAction()
    }
}
