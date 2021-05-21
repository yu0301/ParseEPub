//
//  UnderLineALC.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/14.
//

import UIKit

class UnderLineALC: UIAlertController {

    var returnRankCoditionDelegate:ReturnRankCodition?
    
    func setAlertAction(){
        let one = UIAlertAction(title: "依時間 (新到舊)", style: .default) { [self] _ in
            returnRankCoditionDelegate?.returnRankCodition(condition: .newTimeToOldTime)
        }
        let two = UIAlertAction(title: "依時間 (舊到新)", style: .default) { [self]_ in
            returnRankCoditionDelegate?.returnRankCodition(condition: .OldTimeToNewTime)
        }
        let three = UIAlertAction(title: "依章節 (前到後)", style: .default) { [self]_ in
            returnRankCoditionDelegate?.returnRankCodition(condition: .FrontChapterToBackChapter)
        }
        let four = UIAlertAction(title: "依章節 (後到前)", style: .default) { [self]_ in
            returnRankCoditionDelegate?.returnRankCodition(condition: .BackChapterToFrontChapter)
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        addAction(one)
        addAction(two)
        addAction(three)
        addAction(four)
        addAction(cancel)
    }
       override func viewDidLoad() {
        super.viewDidLoad()
        title = "書籤排序"
        setAlertAction()
    }
}

