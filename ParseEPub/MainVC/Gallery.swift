//
//  Gallery.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/3/23.
//

import UIKit

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}

struct CircleFactory{
    
    static func makeCircle(color:CircleColor.ChooseColor)->UIView{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = color.color
        return view
    }
    
    static func makeThreeViewOverlap(colorOne:CircleColor.ChooseColor,colorTwo:CircleColor.ChooseColor,colorThree:CircleColor.ChooseColor)->UIView{
        let baseView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        let viewOne = UIView(frame: CGRect(x: 5, y: 0, width: 30, height: 30))
        let viewTwo = UIView(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        let viewThree = UIView(frame: CGRect(x: 15, y: 0, width: 30, height: 30))
        viewOne.layer.cornerRadius = 15
        viewOne.clipsToBounds = true
        viewTwo.layer.cornerRadius = 15
        viewTwo.clipsToBounds = true
        viewThree.layer.cornerRadius = 15
        viewThree.clipsToBounds = true
        viewOne.backgroundColor = colorOne.color
        viewTwo.backgroundColor = colorTwo.color
        viewThree.backgroundColor = colorThree.color
        baseView.addSubview(viewThree)
        baseView.addSubview(viewTwo)
        baseView.addSubview(viewOne)
        return baseView
    }
    
}

extension CircleColor.ChooseColor:Codable{
    
}

enum CircleColor{
    enum ChooseColor:String,CaseIterable{
        case white
        case allColor
        case blue
        case red
        case green
        case purple
        case yellow
        
        var color:UIColor{
            switch self{
            case .white:
                return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            case .allColor:
                return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .blue:
                return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            case .red:
                return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            case .green:
                return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            case .purple:
                return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            case .yellow:
                return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            }
        }
    }
}

enum BookMarkColor{
    enum ChooseColor:String,CaseIterable{
        case blue
        case red
        case yellow
        case green
        case purple
        
        var color:UIColor{
            switch self{
            case .blue:
                return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            case .red:
                return #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            case .green:
                return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            case .purple:
                return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            case .yellow:
                return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            }
        }
    }
}
