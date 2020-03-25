//
//  DebugLog.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct AppDebug {

    struct LogError {
        static func record(_ error: Error, info: [String: Any]? = nil) {
            log(String(describing: error))
            
            if info != nil {
                log("other info: \(String(describing: info!))")
            }
        }
    }
    
    public static func log(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
      #if DEBUG
        let fileURL = NSURL(fileURLWithPath: file)
        let fileName = fileURL.deletingPathExtension?.lastPathComponent ?? ""
        print("\(Date().dblog()) \(fileName)::\(function)[L:\(line)] \(message)")
      #endif
      // Nothing to do if not debugging
    }
}
