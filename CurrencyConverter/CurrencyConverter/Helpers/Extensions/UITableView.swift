//
//  UITableView.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: NibReusable {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T where T: NibReusable {
        return self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
    }
    
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: NibReusable {
        if let nib = T.nib {
            self.register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
        } else {
            self.register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
        }
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: NibReusable {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as! T?
    }
}
