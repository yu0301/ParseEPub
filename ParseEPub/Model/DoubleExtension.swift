//
//  DoubleExtension.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/4/21.
//

import UIKit

extension Double {
    func rounding(toDecimal decimal: Int) -> Double {
        let numberOfDigits = pow(10.0, Double(decimal))
        return (self * numberOfDigits).rounded(.toNearestOrAwayFromZero) / numberOfDigits
    }
}
