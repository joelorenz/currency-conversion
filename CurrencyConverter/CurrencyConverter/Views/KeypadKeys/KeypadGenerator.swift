//
//  KeypadGenerator.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

struct KeypadGenerator {
    struct NumericKeypad {
        static func generate() -> [CustomKeyButton] {
            let keys = [
                KeypadGenerator.generate(title: "1", value: "1"),
                KeypadGenerator.generate(title: "2", value: "2"),
                KeypadGenerator.generate(title: "3", value: "3"),
                KeypadGenerator.generate(title: "4", value: "4"),
                KeypadGenerator.generate(title: "5", value: "5"),
                KeypadGenerator.generate(title: "6", value: "6"),
                KeypadGenerator.generate(title: "7", value: "7"),
                KeypadGenerator.generate(title: "8", value: "8"),
                KeypadGenerator.generate(title: "9", value: "9"),
                KeypadGenerator.generate(title: ".", value: "."),
                KeypadGenerator.generate(title: "0", value: "0"),
                KeypadGenerator.generate(title: UIImage(named: "ic_arrow_back_white") ?? "*", value: "\\b"),
            ]
            
            return keys
        }
    }
}

private extension KeypadGenerator {
    
    static func generate(title: Any, value: String) -> CustomKeyButton {
        let key: CustomKeyButton = .nib()
        
        key.value = value
        
        switch title {
            case let image as UIImage:
                key.keyButton.setTitle("", for: .normal)
                key.keyButton.setImage(image, for: .normal)
            case let text as String:
                key.keyButton.setTitle(text, for: .normal)
            default:
                key.keyButton.setTitle("*", for: .normal)
        }

        return key
    }
    
}
