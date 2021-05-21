//
//  DeleteBookMarkALC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/18.
//

import UIKit

class DeleteBookMarkALC: UIAlertController {

    var removeCellDelegate:RemoveCell?
    var tag:Int?
    func setAlertAction(){
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
            self.dismiss(animated: false, completion: nil)
        }
        
        let deleteAction = UIAlertAction(title: "刪除", style: .destructive) { _ in
            self.removeCellDelegate?.removeCell()
        }
        
        addAction(cancelAction)
        addAction(deleteAction)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "提示"
//        message = "是否刪除該筆書籤"
//        preferredStyle = .alert
        setAlertAction()
        // Do any additional setup after loading the view.
    }
}

protocol RemoveCell{
    func removeCell()
}
