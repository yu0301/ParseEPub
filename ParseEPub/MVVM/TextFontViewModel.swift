//
//  TextFontViewModel.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/2/4.
//

import UIKit

class TextFontViewModel{
    var textFont:Box<String>!
    var cellModel:TextFontCellViewModel?
    
    init(model:TextFontRelated){
        self.textFont = Box(model.font!)
        self.cellModel = TextFontCellViewModel(model: model)
        self.cellModel?.textFont = Box(model.font!)
    }
}

struct TextFontCellViewModel{
    var textFont:Box<String>!
    init(model:TextFontRelated){
        self.textFont = Box(model.font!)
    }
}
