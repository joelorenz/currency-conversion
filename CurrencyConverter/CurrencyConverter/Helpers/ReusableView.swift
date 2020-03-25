//
//  ReusableView.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var defaultReuseIdentifier: String { get }
}

extension Reusable where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibReusable: Reusable {
    static var nib: UINib? { get }
}

extension NibReusable {
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

protocol NibCellReusable: NibReusable  where Self: UITableViewCell {
    
}

/// View
protocol NibViewReusable: Reusable {
    static func nib<T: UIView>() -> T
}

extension NibViewReusable where Self: UIView {
    
    static func nib<T>() -> T where T: UIView {
        let nib     = UINib(nibName: String(describing: self), bundle: nil)
        let segment = nib.instantiate(withOwner: nil, options: nil).first! as! T
        
        return segment
    }
}

class ReusableView: UIView, NibViewReusable {
    
    func setupRealView(view: UIView) {
        // pass properties through
        view.frame              = self.frame
        view.autoresizingMask   = self.autoresizingMask
        view.alpha              = 1.0
        view.isHidden           = false
    }
    
    func setup(templateView: UIView, realView: UIView) {
        templateView.constraints.forEach { (constraint) in
            var firstItem = constraint.firstItem
            var secondItem = constraint.secondItem
            
            if let item = firstItem, (item as! NSObject) == templateView {
                firstItem = realView
            }
            
            if let item = secondItem, (item as! NSObject) == templateView {
                secondItem = realView
            }
            
            let newConstraint = NSLayoutConstraint(item: firstItem!,
                                                   attribute: constraint.firstAttribute,
                                                   relatedBy: constraint.relation,
                                                   toItem: secondItem,
                                                   attribute: constraint.secondAttribute,
                                                   multiplier: constraint.multiplier, constant: constraint.constant)
            
            realView.addConstraint(newConstraint)
        }
    }
}
