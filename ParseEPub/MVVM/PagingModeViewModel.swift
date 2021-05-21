//
//  PagingStyleViewModel.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/18.
//

import UIKit

class PagingModeViewModel{
    var pagingMode:Box<String>!
    //PagingMode.mode
    var cellModel:TextFontCellViewModel?
    
    init(model:TextFontRelated){
        if model.pagingMode == nil{
            self.pagingMode = Box("")
//            PagingMode.mode.paging
        }else{
            self.pagingMode = Box(model.pagingMode!)
        }

    }
}
