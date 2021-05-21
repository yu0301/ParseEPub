//
//  OPFManifest.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/23.
//

import Kanna
import UIKit

struct OPFManifest {
    
    private(set) var items = [String: ManifestItem]()
    private var ncxFileName = ""
    public var contentSTextArray = [String]()
    public var chapterArray: [[String: String]] = []
    public var titleDic = [String:String]()
    public var chapterInex:[Int] = []
    public var chapterTitle:[String] = []
    public var chapterPath:[String] = []
    
    
    //    private(set) var hrefs = [String: ManifestItem]()
    let predicate = NSPredicate()
    
    
    private func getparentPathFrom(path: String) -> String {
        var components = path.split(separator: "/")
        components.removeFirst()
        components.removeLast()
        var parentPath: String = ""
        for item in components {
            parentPath.append("/")
            parentPath.append(String(item))
        }
        return parentPath
    }
    
    init?(package: XMLElement,opfPath:String,baseURL:URL) {
        let opfNamespace = ["opf": "http://www.idpf.org/2007/opf"]
        guard let manifest = package.at_xpath("opf:manifest", namespaces: opfNamespace) else { return nil }
       
        //個檔案列表(css,ncx html) array，從裡頭找出ncxFileName
        //如果media type = application/x-dtbncx+xml，將之herf找出
        let itemElements = manifest.xpath("opf:item", namespaces: opfNamespace)
        
        for (index,itemElement) in itemElements.enumerated() {
            guard let item = ManifestItem(itemElement) else { continue }
            //如果item有html
            if item.href.hasSuffix("html"){
                contentSTextArray.append(item.href)
            }
            
            //get ncx filename
            if item.mediaType.hasPrefix("application/x-dtbncx+xml"){
                self.ncxFileName = item.href
            }
           
            //以下另外處理
            var chapterDict: [String: String] = [:]
            //拿到title.html
            let chapterRef = item.href
            //轉成路徑
            let chapterPath = getparentPathFrom(path: opfPath) + "/\(chapterRef)"
            
            //index 當作給目錄去到達該頁面的index
//            chapterDict["chapterIndex"] = String(index)
//            chapterDict["chapterTitle"] = item.href
//            chapterDict["chapterPath"] = chapterPath
            self.chapterInex.append(index)
            self.chapterPath.append(chapterPath)
            chapterArray.append(chapterDict)
        }
        
        

            let ncxNameSpace = ["ncx":"http://www.daisy.org/z3986/2005/ncx/"]
            //navmap
            let ncxFilePath = baseURL.appendingPathComponent(ncxFileName)
            //先進主頁面
            let document = try! Kanna.XML(url: ncxFilePath, encoding: .utf8)
            //進到navMap
            let navMap = document.at_xpath("//ncx:navMap", namespaces: ncxNameSpace)
            //進到navpoint
//            let xpath = "//ncx:content[@src='chapter20.html']/../ncx:navLabel/ncx:text"

            for item in itemElements{
                
                guard let item = ManifestItem(item) else { continue }
                //把每個scr對應的title解出
                let xpath = "//ncx:content[@src='\(item.href)']/../ncx:navLabel/ncx:text"
                let navPoint = navMap!.xpath(xpath, namespaces: ncxNameSpace)
                if navPoint.count != 0{
                    let title = navPoint[0].content
                    self.chapterTitle.append(title!)
                }
            }
    }
}


public struct ManifestItem {
    let id: String
    let href: String
    let mediaType: String
    let properties: String?
    // Others like duration, fallback, etc.
    
    init?(_ item: XMLElement) {
        guard let itemId = item["id"] else { return nil }
        guard let itemHref = item["href"] else { return nil }
        guard let itemMediaType = item["media-type"] else { return nil }
        id = itemId
        href = itemHref
        mediaType = itemMediaType
        properties = item["properties"]
    }
}

public struct NCX {
    let itemref: String
    
    init?(_ item: XMLElement) {
        guard let itemItemref = item["src"] else { return nil }
        self.itemref = itemItemref
    }
}




////<navPoint id="coverpage" playOrder="0">
//<navLabel><text>封面</text></navLabel>
//<content src="coverpage.html"/>
////</navPoint>
