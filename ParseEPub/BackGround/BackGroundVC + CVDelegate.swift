//
//  BackGroundVC + CVDelegate.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/22.
//

import UIKit

extension BackGroundVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView{
        case firsrBackGroundCV:
            let cellOfFirstCV = firsrBackGroundCV.cellForItem(at: indexPath) as! FirstBackGroundCVCell
            let colorHexOfFirstCV = cellOfFirstCV.colorHex
//            let colorLightIndexOfFirstCV = cellOfFirstCV.colorLightIndex
            switch indexPath.row{
            case 0...2:
                //點擊時拿cell的color和slider回傳到mainvc然後在換色
                
//                backGroundModel.colorLightIndex.value = colorLightIndexOfFirstCV!
                backGroundModel.originColor.value = colorHexOfFirstCV
                
            case 3:
                moreColorView.isHidden = false
            default:
                fatalError()
            }
        case moreColorView.secondBackGroundCV:
            let cellOfSecondtCV = moreColorView.secondBackGroundCV.cellForItem(at: indexPath) as! SecondBackGroundCVCell
            
            //blank
            let colorHexOfSecondCV =  cellOfSecondtCV.colorHex
//            let colorLightIndexOfSecondtCV = cellOfSecondtCV.colorLightIndex
            switch indexPath.row{
            case 0...5:
                
                //動到slider去計算?不
                backGroundModel.originColor.value = colorHexOfSecondCV
                moreColorView.isHidden = true
            default:
                fatalError()
            }
        default:
            fatalError()
        }
    }
}




