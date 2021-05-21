//
//  FRSource.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/28.
//

import UIKit

open class FRResource: NSObject {
    var id: String!
    var properties: String?
    var mediaType: MediaType!
    var mediaOverlay: String?
    
    public var href: String!
    public var fullHref: String!

    func basePath() -> String! {
        if href == nil || href.isEmpty { return nil }
        var paths = fullHref.components(separatedBy: "/")
        paths.removeLast()
        return paths.joined(separator: "/")
    }
}
