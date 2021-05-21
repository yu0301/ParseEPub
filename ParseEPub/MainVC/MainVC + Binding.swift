//
//  MainVC + Binding.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/8.
//

import UIKit
//MARK: - MVVM binding
extension MainVC{
    
    func mvvmBinding(){
        
        fontVC.headerViewModel.textSize.binding { (textSize) in
            self.textSize = textSize!
            self.fontVC.fonTableView.reloadData()
        }
        
        fontVC.headerViewModel.textSpacing.binding { (textSpacing) in
            self.textSpacing = textSpacing!
            self.fontVC.fonTableView.reloadData()
        }
        
        fontVC.boundaryViewModel.textBorder.binding { (textBorder) in
            self.border = textBorder!
        }
        
        fontVC.fontViewModel.textFont.binding { (textFont) in
            self.font = textFont!
        }
        
        fontVC.pagingModeViewModel.pagingMode.binding { (pagingMode) in
            self.pagingMode = pagingMode!
        }
        
        fontVC.alignmentStyleViewModel.alignmentStyle.binding { (alignmentStyle) in
            self.alignmentStyle = alignmentStyle!
        }
        
        backGroundVC.backGroundModel.backGroundColor.binding { (color) in
            self.backGroundColor = color!
        }
        
        backGroundVC.backGroundModel.colorLightIndex.binding{(colorLightIndex) in
            self.colorLightIndex = colorLightIndex!
        }
        
        backGroundVC.backGroundModel.originColor.binding { (originColor) in
            self.originColor = originColor!
        }
    }
}
