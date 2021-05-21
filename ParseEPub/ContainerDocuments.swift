//
//  ContainerDocuments.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/23.
//

import Kanna
import Foundation

//解析container找到路徑
struct ContainerDocument {
    let opfPath: String

    let document: XMLDocument

    init?(url:URL) {
            
        do {
            // Just one line to get the DOM document of a XML file
            document = try Kanna.XML(url: url, encoding: .utf8)
            
            // Create namespace for the 'container' element
            //名字隨便，單是後面使用時要相同(解開XPath)
            let namespace = ["ctn": "urn:oasis:names:tc:opendocument:xmlns:container"]
            // Our first XPath query
            let xpath = "//ctn:rootfile[@full-path]/@full-path"
            
            // Execute the XPath query by 'at_xpath'
            //挑選特定位置進入到節點
            guard let path = document.at_xpath(xpath, namespaces: namespace)?.text else { return nil }
            opfPath = path
        
        } catch {
            
            print("Parsing the XML file at \(url) failed with error: \(error)")
            return nil
        }
    }
}
