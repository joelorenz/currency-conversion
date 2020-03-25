//
//  GCDUtil.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct GCDUtil {
    struct Main {
        static func async(after delay: Double, execute: @escaping () -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                DispatchQueue.main.async {
                    execute()
                }
            }
        }
        
        static func async(execute: @escaping () -> Void ) {
            DispatchQueue.main.async {
                execute()
            }
        }
    }
    
    struct Background {
        static var backgroundQueue: DispatchQueue {
            return DispatchQueue(label: "com.paypay.concurrent.task", attributes: DispatchQueue.Attributes.concurrent)
        }
        
        static func beginTask(
            _ execute: @escaping () -> Void
        ) {
            DispatchQueue.global(qos: .background).async {
                execute()
            }
        }
                   
        static func beginTaskFrom(
            background task: @escaping () -> Void,
            toMain mainTask: @escaping () -> Void
        ) {
            DispatchQueue.global(qos: .background).async {
                task()
                DispatchQueue.main.async {
                        mainTask()
                    }
                }
            }
    }
}
