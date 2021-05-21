//
//  OPFDocument.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/23.
//

import Kanna
import Foundation

struct OPFDocument {
    
    //MARK:-OPFDocuments會有這三個children elements
    let metadata: OPFMetadata
    //拿到內文的html
    let manifest: OPFManifest
    let spine: OPFSpine
    // Other elements, like collection, guide, etc.

    let document: XMLDocument

    //拿到opf路徑
    init?(url: URL,baseUrl:URL) {
        do {
            // Get the OPF XMLDocument
            document = try Kanna.XML(url: url, encoding: .utf8)
            // Create namespace for the 'package' element
            let opfNamespace = ["opf": "http://www.idpf.org/2007/opf"]
            let opfPath = "\(url)"
            // Execute XPath query to fetch the 'package' element
            guard let package = document.at_xpath("/opf:package", namespaces: opfNamespace) else { return nil }
            
            //ncx解決
            //最終檔案解
            let opf = document.xpath("//opf:itemref", namespaces: opfNamespace)
            //可解
            for i in opf{
                let item = OpfItem(i)
//
            }
            
            // Parse the three main elements
            // Will explain them later
            guard let metadata = OPFMetadata(package: package) else { return nil }
            guard let manifest = OPFManifest(package: package, opfPath: opfPath, baseURL: baseUrl) else { return nil }
            guard let spine = OPFSpine(package: package) else { return nil }
            self.metadata = metadata
            self.manifest = manifest
            self.spine = spine
        } catch {
            print("Parsing the XML file at \(url) failed with error: \(error)")
            return nil
        }
    }
}



public struct OpfItem {
    let itemref: String
    
    init?(_ item: XMLElement) {
        guard let itemItemref = item["idref"] else { return nil }
        self.itemref = itemItemref
    }
}
