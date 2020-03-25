//
//  SignalObserver.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

struct SignalObserver<T: Any> {
    private(set) var (listener, sender) = Signal<T, Never>.pipe()
}
