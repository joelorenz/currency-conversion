//
//  FileHelper.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/24/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

// MARK: - File Management

struct FileHelper {
    
    static func jsonDictionaryFromFile(_ name: String, bundle: Bundle = Bundle.main) -> JSONDictionary {
        let path = bundle.path(forResource: name, ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let options = JSONSerialization.ReadingOptions.mutableContainers
          
        return try! JSONSerialization.jsonObject(with: data, options: options) as! JSONDictionary
    }
}
