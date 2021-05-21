//
//  EpubBook.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/23.
//

import Foundation


//紀錄ops檔案位置，引導軟體讀取檔案
class EPUBBook {
    //拿路徑使用
    let container: ContainerDocument
    //拿到opf就可以使裡頭的資料了
    let opf:OPFDocument
    var opfURL:URL?
    let baseURL:URL
    //把拿到的html路經包成array然後再present
    
        //要拿到rootfile
    init?(contentsOf baseURL: URL) {
        //container.xml是用來告訴閱讀器content-opf的位置
        self.baseURL = baseURL
        let containerURL = baseURL.appendingPathComponent("META-INF/container.xml")
        //解析container的檔案 how?
        guard let container = ContainerDocument(url: containerURL) else { return nil }
        self.container = container
        //得到OPF檔案的位置
        let opfURL = baseURL.appendingPathComponent(container.opfPath)
        //if 沒有斜線則刪掉opfpath如果有的話刪除斜線後面的部分
        if container.opfPath.contains("/"){
            var newPath = container.opfPath
            let findIdxFirst = container.opfPath.firstIndex(of: "/")
            //刪除
            newPath.removeSubrange(newPath.index(newPath.firstIndex(of: "/")!, offsetBy: 1)..<newPath.endIndex)
       
            let newURL = baseURL.appendingPathComponent(newPath)
            self.opfURL = newURL
            //append到baseurl
            
        }else{
            self.opfURL = baseURL
        }
        
        guard let opf = OPFDocument(url: opfURL, baseUrl: self.opfURL!) else { return nil }
        self.opf = opf
       
    }

}

//MARK: - 步驟
//1.拿到META-INF/container.xml的路徑
//2.透過這路徑拿到container
//3.從這個container裡頭拿到OPF的路徑(進入這個路徑可以拿到mani、meta、spine)
//4.再由這個路徑去拿OPF檔案
//5.EPubBook可以拿到containerdocument
//6.可以拿到meta、manifest、spine等內容
//7.然後再個別解析下一層

