//
//  EpubParser.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/23.
//

import Foundation
import ZIPFoundation

//解析epub
class EPUBParser {
    static func parseFile(at sourceURL: URL) -> EPUBBook? {

       //  zipFileURL，先拿到本地端檔案的位置
        let zipFileURL = sourceURL
        
        // 拿到epub的檔案名稱，通常會把檔案位置包成url
        // = hamlet
        let filename = sourceURL.deletingPathExtension().lastPathComponent
        
        // The directory to save the unzipped files
        //保存未解壓縮檔案的目錄，取得hamlet目錄
        //MARK:-最初的網址
        //在拿到目錄即可
        let destinationURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent(filename)
        // 宣告filemanager
        let fileManager = FileManager()
        //檢查路徑是否存在
        //destinational為整包epub的初始路徑
        if fileManager.fileExists(atPath: destinationURL.path) == false {
            do {
                //確認目錄是否存在，如果沒有的話就創造一個
                //這邊是從未解壓縮的檔案目錄去拿取
                try fileManager.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
                //解壓縮epub檔案
                try fileManager.unzipItem(at: zipFileURL, to: destinationURL)
            } catch {
                print("Extraction of the ePub file failed with error: \(error)")
                return nil
            }
        }
        // Parse the ePub file
        return EPUBBook(contentsOf: destinationURL)
    }
}

//MARK:-網址的取得步驟
//1.拿到本地端檔案的位置(bundle)
//2.拿到檔案的名字(lastPathComponent)
//3.存到tmp(appendingPathComponent)
//4.把剛剛創建的url放入epubbook再回傳
