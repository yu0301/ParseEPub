//
//  MVVM.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/27.
//

import UIKit

//MARK:-simple MVVM

class HeaderViewModel{
    var textSize:Box<String>!
    var textSpacing:Box<String>!
    var cellModel:HeaderCellViewModel?
    
    init(model:TextFontRelated){
        self.textSize = Box(model.textSize!)
        self.textSpacing = Box(model.textSpacing!)
        self.cellModel = HeaderCellViewModel(model: model)
        self.cellModel?.textSize = Box(model.textSize!)
        self.cellModel?.textSpacing = Box(model.textSpacing!)
    }
}

struct HeaderCellViewModel{
    var textSize:Box<String>!
    var textSpacing:Box<String>!
    
    init(model:TextFontRelated){
        self.textSize = Box(model.textSize!)
        self.textSpacing = Box(model.textSpacing!)
    }
}


class Box<T>{
    
    typealias ValueChanged = ((T?) -> Void)
    var valueChanged: ValueChanged?
    
    var value:T{
        didSet{
            valueChanged?(value)
        }
    }
    
    func binding(_ valueChanged:ValueChanged?){
        self.valueChanged = valueChanged
        valueChanged?(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}

