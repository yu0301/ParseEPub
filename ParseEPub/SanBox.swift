//
//  SanBox.swift
//  ParseEPub
//
//  Created by 陳冠諭 on 2020/12/29.
//

import UIKit


class LYBShahePathExtention: NSObject {
   
    let data = Bundle.main.path(forResource: "The Silver Chair", ofType: "epub")
    //获取沙盒根路径
    func getRootPath()->(String){
        let home=NSHomeDirectory()
        return home
    }
    
    //獲取documents路徑
    let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.userDomainMask,true).last
    
    func saveWithFile() {
        
        // 1、获得沙盒的根路径
        let home = NSHomeDirectory()//获取沙盒根路径
        //获取文档目录路径--方法二，沙盒根路径字符串拼接路径
        let docPath = home + "/Documents/"
        // 3、获取文本文件路径
        let filePath = data
        let ar = ["aa","ba","ca"] as NSArray//必须要转换成NSArray，否则不成功报错
        // 4、将数据写入文件中
        ar.write(toFile: filePath!,atomically : true)
        print(ar)
    }
}
