//
//  ColorExtension.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/22.
//

import UIKit

extension UIColor{
   
//    func hexCovertToUIColor(hex:UInt32,alpha:Double=1.0)->UIColor{
//        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
//        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
//        let blue = CGFloat((hex & 0xFF)) / 255.0
//        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
//    }
    
    func colorToCircleColorChooseColor()->CircleColor.ChooseColor{
        switch self{
        case #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):
            return .allColor
        case #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1):
            return .red
        case #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1):
            return .green
        case #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1):
            return .purple
        case #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1):
            return .yellow
        case #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1):
            return .allColor
        case #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1):
            return .blue
        default:
            fatalError("no color")
        }
    }
    
//    func hexStringToUIColor (hex:String) -> UIColor {
//        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//
//        if (cString.hasPrefix("#")) {
//            cString.remove(at: cString.startIndex)
//        }
//
//        if ((cString.count) != 6) {
//            return UIColor.gray
//        }
//
//        var rgbValue:UInt64 = 0
//        Scanner(string: cString).scanHexInt64(&rgbValue)
//
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//    }
    
    func toHexString() -> String {
           var r:CGFloat = 0
           var g:CGFloat = 0
           var b:CGFloat = 0
           var a:CGFloat = 0
        
           getRed(&r, green: &g, blue: &b, alpha: &a)
           
           let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
           
        return NSString(format:"#%06x", rgb) as String
       }
}
