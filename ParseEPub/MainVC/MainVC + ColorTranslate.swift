//
//  MainVC + ColorTranslate.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/19.
//

import UIKit

extension MainVC{
    
    func hexStringToRGB (hex:String) -> [CGFloat] {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return [CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,CGFloat(rgbValue & 0x0000FF) / 255.0]
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
//        return [CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,CGFloat(rgbValue & 0x0000FF) / 255.0]
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func changeTheBrightness(RGB:[CGFloat],index:Float)->String{
        //應該每次都用最大值，然后再乘
        let rawRed = RGB[0]
        let rawGreen = RGB[1]
        let rawBlue = RGB[2]
        
        
        let red = CGFloat(index / 100) * rawRed
        let green = CGFloat(index / 100) * rawGreen
        let blue = CGFloat(index / 100) * rawBlue
        //UIColor轉HEX
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1).toHexString()
        return color
    }
}
