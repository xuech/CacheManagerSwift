//
//  CacheManager.swift
//  SwiftCache
//
//  Created by xuech on 16/6/8.
//  Copyright © 2016年 obizsoft. All rights reserved.
//

import UIKit

class CacheManager: NSObject {
    
    /**
     读取缓存

     */
    static func readCacheSize()->String {
        return String(format: "%.2f",forderSizeByDocumentPath(NSHomeDirectory()))
        
    }
    
    
    /**
     *  清除缓存
     */
    static func cleanCache(competion:()->Void){
        CacheManager.deleteFolder(NSHomeDirectory()+"/Documents")
        CacheManager.deleteFolder(NSHomeDirectory()+"/Library")
        CacheManager.deleteFolder(NSHomeDirectory()+"/tmp")
        competion()
    }
    
    
    /**
     计算单个文件大小
     */
    static func retureFileSize(path:String)-> Double{
        let manage = NSFileManager.defaultManager()
        var fileSize: Double = 0.0
        do{
            fileSize = try manage.attributesOfItemAtPath(path)["NSFileSize"] as! Double
        }catch{
            print("未知错误")
        }
        return fileSize/1024/1024
    }
    
    /**
     遍历所有子目录 并计算文件大小
     */
    static func forderSizeByDocumentPath(forderPath: String) -> Double {
        let manage = NSFileManager.defaultManager()
        if !manage.fileExistsAtPath(forderPath) {
            print("文件不存在")
        }
        let subFilePath = manage.subpathsAtPath(forderPath)!
        var fileSize:Double = 0
        for path in subFilePath {
            let fileAbsoluePath = forderPath + "/" + path
            fileSize += retureFileSize(fileAbsoluePath)
        }
        return fileSize
    }
    
    
    /**
     删除单个文件
     */
    static func deleteFile(path:String){
        let manage = NSFileManager.defaultManager()
        do{
            try manage.removeItemAtPath(path)
        }catch{
            
        }
    }
    
    /**
     删除文件夹下的所有文件
     */
    static func deleteFolder(folderPath:String){
        let manage = NSFileManager.defaultManager()
        if !manage.fileExistsAtPath(folderPath) {
        }
        let childFilePath = manage.subpathsAtPath(folderPath)
        for path in childFilePath!{
            let fileAbsoluePath = folderPath+"/"+path
            CacheManager.deleteFile(fileAbsoluePath)
        }
    }

    
    
}
