//
//  OPFSpine.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/23.
//

import Kanna

struct OPFSpine {
    private(set) var idrefs = [String]()

    let opfNamespace = ["opf": "http://www.idpf.org/2007/opf"]
    
    init?(package: XMLElement) {  
        guard let spine = package.at_xpath("opf:spine", namespaces: opfNamespace) else { return nil }
        idrefs = spine.xpath("opf:itemref[@idref]/@idref", namespaces: opfNamespace)
                      .map { $0.text }
                      .compactMap { $0 } //把nil挑出
    
    }
}

