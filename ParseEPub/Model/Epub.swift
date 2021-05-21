//
//  Epub.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/4.
//

import Foundation

enum Epub:Int{
    
    //丟入index就可以拿到該本書的資料
    case bookOne = 0
    case bookTwo = 1
    case bookThree = 2
    case bookFour = 3
    case bookFive = 4
    
    var name: String {
        switch self {
        case .bookOne:      return "The Silver Chair" // standard eBook
        case .bookTwo:      return "the silver chair two" // audio-eBook
        case .bookThree:    return "Epubguide"
        case .bookFour:     return "每天懂一点好玩心理学"
        case .bookFive:     return "1611381443_for_esme_-_with_love_and_squalor_-_jd_salinger"
        }
    }
    
    var bookPath: URL? {
        return Bundle.main.url(forResource: self.name, withExtension: "epub")
    }
}


