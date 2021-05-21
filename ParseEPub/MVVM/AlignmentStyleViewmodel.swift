//
//  AlignmentStyleViewmodel.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/18.
//




class AlignmentStyleViewModel{
    var alignmentStyle:Box<String>!
    
    init(model:TextFontRelated){
        if model.textAlignment == nil{
            self.alignmentStyle = Box("預設")
        }else{
            self.alignmentStyle = Box(model.textAlignment!)
        }
    
    }
}

