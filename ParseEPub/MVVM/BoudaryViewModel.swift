//
//  BoudaryViewModel.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/2/4.
//

import UIKit

class BoundaryViewModel{
    var textBorder:Box<String>!
    var cellModel:BoundaryCellViewModel?
    
    init(model:TextFontRelated){
        self.textBorder = Box(model.textBorder!)
        self.cellModel = BoundaryCellViewModel(model: model)
        self.cellModel?.textBorder = Box(model.textBorder!)
    }
}

struct BoundaryCellViewModel{
    var textBorder:Box<String>!

    init(model:TextFontRelated){
        self.textBorder = Box(model.textBorder!)
    }
}
