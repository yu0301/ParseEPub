//
//  UserDefault.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2021/1/19.
//

import Foundation
class UserDefaultData{
    
    //MARK: -fontdata
    static func saveFontData(fontData: TextFontRelated) {
        // Use PropertyListEncoder to convert Player into Data / NSData
        do {
            let fontData = try PropertyListEncoder().encode(fontData)
            UserDefaults.standard.set(fontData, forKey: "fontDataKey")
        } catch {
            print("Save data error.")
        }
    }
    
    static func loadFontData() -> TextFontRelated {
        guard let fontData = UserDefaults.standard.object(forKey: "fontDataKey") as? Data else { return TextFontRelated() }
        
        // Use PropertyListDecoder to convert Data into Player
        
        guard let fontdataArray = (try? PropertyListDecoder().decode(TextFontRelated.self, from: fontData)) else {
            print("Load data error.")
            return TextFontRelated() }
        return fontdataArray
    }
    
    //MAKR: -underlineData
    static func saveUnderLineData(underLineArray: [UnderLineData]) {
        // Use PropertyListEncoder to convert Player into Data / NSData
        do {
            let underLine = try PropertyListEncoder().encode(underLineArray)
            UserDefaults.standard.set(underLine, forKey: "underLineDataKey")
        } catch {
            print("Save data error.")
        }
    }
    
    static func loadUnderLineData() -> [UnderLineData] {
        guard let underLine = UserDefaults.standard.object(forKey: "underLineDataKey") as? Data else { return [UnderLineData]() }
        
        // Use PropertyListDecoder to convert Data into Player
        
        guard let underLineArray = (try? PropertyListDecoder().decode([UnderLineData].self, from: underLine)) else {
            print("Load data error.")
            return [UnderLineData]() }
        return underLineArray
    }
    
    
    //MARK:- bookMarkData
    static func saveBookMarkData(bookMakArray: [BookMarkData]) {
        // Use PropertyListEncoder to convert Player into Data / NSData
        do {
            let bookMark = try PropertyListEncoder().encode(bookMakArray)
            UserDefaults.standard.set(bookMark, forKey: "bookMarkDataKey")
        } catch {
            print("Save data error.")
        }
    }
    
    static func loadBookMarkData() -> [BookMarkData] {
        guard let bookMark = UserDefaults.standard.object(forKey: "bookMarkDataKey") as? Data else { return [BookMarkData]() }
        
        // Use PropertyListDecoder to convert Data into Player
        
        guard let bookMarArray = (try? PropertyListDecoder().decode([BookMarkData].self, from: bookMark)) else {
            print("Load data error.")
            return [BookMarkData]() }
        return bookMarArray
    }
    
    //MARK: - WVBackGroundColor
    
    static func saveWVBackGroundColorData(WVBackGroundColor: WVBackGroundColor) {
        do {
            let backGroundColor = try PropertyListEncoder().encode(WVBackGroundColor)
            UserDefaults.standard.set(backGroundColor, forKey: "backGroundDataKey")
        } catch {
            print("Save data error.")
        }
    }
    
    static func loadWVBackGroundColorData() -> WVBackGroundColor {
        guard let backGround = UserDefaults.standard.object(forKey: "backGroundDataKey") as? Data else { return WVBackGroundColor() }
        
        // Use PropertyListDecoder to convert Data into Player
        
        guard let backGroundArray = (try? PropertyListDecoder().decode(WVBackGroundColor.self, from: backGround)) else {
            print("Load data error.")
            return WVBackGroundColor() }
        return backGroundArray
    }

}
