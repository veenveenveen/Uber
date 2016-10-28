//
//  Global.swift
//  Uber
//
//  Created by 黄启明 on 2016/10/27.
//  Copyright © 2016年 huatengIOT. All rights reserved.
//

import Foundation
import UIKit
//打印日志
func FxLog(message: String, function: String = #function) {
    #if DEBUG
        print("Log: \(message), \(function)")
    #else
        
    #endif
}
//判断系统版本
func currentSystemVersion() -> Float {
    let device = UIDevice.current
    let sysVer = Float(device.systemVersion)
    FxLog(message: "current version: \(sysVer!)")
    return sysVer!
}
//设备检测
func isiphone6or7() -> Bool {
    if screenH == 667 {
        return true
    }
    else {
        return false
    }
    
}

func judgeIOS() {
    #if os(iOS)
        FxLog(message: "iOS")
    #elseif os(OSX)
        FxLog(message: "mac OS")
    #endif
}
