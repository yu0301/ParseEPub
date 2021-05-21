//
//  State.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/7.
//

import Foundation
import UIKit

let fullScreenX = UIScreen.main.bounds.maxX
let fullScreenY = UIScreen.main.bounds.maxY

enum PickState{
    case normal
    case menu
    case fontEdit
    case backGroundColor
    case allHidden
}
//fontColor: String = "#120101", backgroundColor:String = "#FFD382",fontFamily: String = "Gotham-Book", fontSize: String = "40"


enum FontColor{
    case black,yellow,green,red
    var color:String{
        switch self{
        case .black:
            return "#000000"
        case .yellow:
            return "#f2ff00"
        case .green:
            return "#4dff00"
        case .red:
            return "#ff0000"
        }
    }
}

enum BackgroundColor{
    case black,yellow,green,red
    var color:String{
        switch self{
        case .black:
            return "#000000"
        case .yellow:
            return "#f2ff00"
        case .green:
            return "#4dff00"
        case .red:
            return "#ff0000"
        }
    }
}

enum FontFamily{
    case GothamBook,AmericanTypewriter,AmericanTypewriterBold
    var font:String{
        switch self{
        
        case .GothamBook:
            return "Gotham-Book"
        case .AmericanTypewriter:
            return "AmericanTypewriter"
        case .AmericanTypewriterBold:
            return "AmericanTypewriter-Bold"
        }
    }
}

enum FontSize{
    
}
