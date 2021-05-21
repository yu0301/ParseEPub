//
//  AlignmentStyleALC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/8.
//

import UIKit

class AlignmentStyleALC: UIAlertController {
    
    var passAlignmentStyle:((String)->Void)?
    func setAlertAction(){
        let one = UIAlertAction(title: "預設", style: .default) { [self] _ in
            passAlignmentStyle!("預設")
        }
        let two = UIAlertAction(title: "左右對齊", style: .default) { [self]_ in
            passAlignmentStyle!("左右對齊")
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        addAction(one)
        addAction(two)
        addAction(cancel)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "對齊方式"
        setAlertAction()
    }

}
