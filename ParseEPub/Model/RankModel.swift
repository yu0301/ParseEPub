//
//  RankModel.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/21.
//

import UIKit

enum RankModel{
    case newTimeToOldTime,OldTimeToNewTime,FrontChapterToBackChapter,BackChapterToFrontChapter
    var rank:String{
        switch self{
        
        case .newTimeToOldTime:
            return "依時間 (新到舊)"
        case .OldTimeToNewTime:
            return "依時間 (舊到新)"
        case .FrontChapterToBackChapter:
            return "依章節 (前到後)"
        case .BackChapterToFrontChapter:
            return "依章節 (後到前)"
        }
    }
}
