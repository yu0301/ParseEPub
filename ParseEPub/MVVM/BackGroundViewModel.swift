//
//  BackGroundViewModel.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/2/22.
//

import UIKit

class BackGroundViewModel{
    
    var backGroundColor:Box<String>
    var colorLightIndex:Box<Float>
    var originColor:Box<String>
    init(model:TextFontRelated){
        self.backGroundColor = Box(model.backGroundColor!)
        
        if model.colorLightIndex == nil{
            self.colorLightIndex = Box(0)
        }else{
            self.colorLightIndex = Box(model.colorLightIndex!)
        }
        
        if model.originColor == nil{
            self.originColor = Box("#FFD382")
        }else{
            self.originColor = Box(model.originColor!)
        }
    }
}
