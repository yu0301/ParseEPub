//
//  OPFMetadata.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/23.
//

import Kanna


struct OPFMetadata {
    // DCMES Required Elements
    //可以讀取但是不能修改(唯獨檔)
    private(set) var identifiers = [String]()
    private(set) var titles = [String]()
    private(set) var languages = [String]()
    // DCMES Optional Elements
    private(set) var creators = [String]()
    private(set) var date: String?
    private(set) var publisher: String?
    // Others like contributor, description, etc.

    init?(package: XMLElement) {
        let opfNamespace = ["opf": "http://www.idpf.org/2007/opf"]
        //要取的檔案是opf裡的metadata
        guard let metadata = package.at_xpath("opf:metadata", namespaces: opfNamespace) else { return nil }
        //再從metadata取個別資訊
        // DCMES(都柏林詮釋資料核心集)
        //這些資訊都以 dc:XXX(key:value的形式包起來)
        let dcNamespace = ["dc": "http://purl.org/dc/elements/1.1/"]
        let dcmes = metadata.xpath("dc:*", namespaces: dcNamespace)
      
        //tagName為名字，text為內容
        for dc in dcmes {
            guard let text = dc.text else { continue }
            switch dc.tagName {
            case "identifier":
                identifiers.append(text)
            case "title":
                titles.append(text)
            case "language":
                languages.append(text)
            case "creator":
                creators.append(text)
            case "date":
                date = text
            case "publisher":
                publisher = text
            default:
                break
            }
        }
    }
}
