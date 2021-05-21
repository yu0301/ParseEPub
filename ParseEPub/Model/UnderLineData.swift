//
//  BookMarksData.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/19.
//

import UIKit


//書籤和畫線分開
//把它變array每個元素就是一筆資料
struct BookMarkData:Codable{
    var time:[Int]?
    var bookMarkColor:QuoteColor?
    var bookMarkTitle:String?
//    var booMarksContent:String?
//    var bookMarkColor:CircleColor.ChooseColor?
    var state:EditState.state?
    var chapterIndex:Int
    var heightIndex:Int
    var bookMarkContent:String?
    var bookMarkIndex:(Int,Int){
        return (chapterIndex,heightIndex)
    }
}


struct UnderLineData:Codable {
    //    var bookMarksTime
    //    var bookMarksTitle
    var chapterIndex:Int?
    var time:[Int]?
    var state:EditState.state?
    var underLineTitle:String
    var underLineColor:CircleColor.ChooseColor?
    var underLineContent:String?
}

struct TextFontRelated:Codable{
    var textSize:String?
    var textSpacing:String?
    var textArrangement:String?
    var textBorder:String?
    var font:String?
    var pagingMode:String?
    //PagingMode.mode?
    var textAlignment:String?
    var backGroundColor:String?
    var defaultSet:String?
    var colorLightIndex:Float?
    //    var sliderValue:CGFloat?
    
    
    
    var originColor:String?
    //    var colorLightIndex:Float?
}

struct WVBackGroundColor:Codable{
    var backGroundColor:String?
}


struct QuoteColor : Codable {
    var red : CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
    
    var uiColor : UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    init(uiColor : UIColor) {
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }
}


extension EditState.state:Codable{
    
}

enum EditState{
    enum state:String,CaseIterable{
        case edit
        case create
        var statee:String{
            switch self{
            
            case .edit:
                return "edit"
            case .create:
                return "create"
            }
        }
    }
}


extension PagingMode.mode:Codable{
    
}

enum PagingMode{
    enum mode:String,CaseIterable{
        case scroll
        case paging
        
        var mode:String{
            switch self{
            case .scroll:
                return "滾動"
            case .paging:
                return "翻頁"
            }
        }
    }
}

