//
//  ReaderConfig.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/2/5.
//

//import UIKit
//
//class ReaderConfig:NSObject{
//    
//    var scrollDirection: FolioReaderScrollDirection = .defaultVertical
//    func isDirection<T> (_ vertical: T, _ horizontal: T, _ horizontalContentVertical: T) -> T {
//        switch self.scrollDirection {
//        case .vertical, .defaultVertical:       return vertical
//        case .horizontal:                       return horizontal
//        case .horizontalWithVerticalContent:    return horizontalContentVertical
//        }
//    }
//}
//
//
//public enum FolioReaderScrollDirection: Int {
//    case vertical
//    case horizontal
//    case horizontalWithVerticalContent
//    case defaultVertical
//
//    /// The current scroll direction
//    ///
//    /// - Returns: Returns `UICollectionViewScrollDirection`
//    func collectionViewScrollDirection() -> UICollectionView.ScrollDirection {
//        switch self {
//        case .vertical, .defaultVertical:
//            return .vertical
//        case .horizontal, .horizontalWithVerticalContent:
//            return .horizontal
//        }
//    }
//}
