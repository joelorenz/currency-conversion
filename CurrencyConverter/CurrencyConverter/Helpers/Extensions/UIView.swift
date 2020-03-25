//
//  UIView.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

// MARK: - Constraints
extension UIView {
    
    /// Add constraint to superview with offsets
    ///
    /// - Parameters:
    ///   - top: Top offset
    ///   - left: Leading offset
    ///   - bottom: Bottom offset
    ///   - right: Trailing offset
    /// - Returns: Current view
    @discardableResult
    func pin(
        top: CGFloat = 0.0,
        leading: CGFloat = 0.0,
        bottom: CGFloat = 0.0,
        trailing: CGFloat = 0.0
    ) -> UIView {
      
        guard let superview = superview else { return self }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        leadingAnchor.constraint(equalTo: superview.leadingAnchor,
                                 constant: leading).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                  constant: trailing).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor,
                             constant: top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor,
                                constant: bottom).isActive = true
        return self
    }
  
    func updateConstraint(
        attribute: NSLayoutConstraint.Attribute,
        constant: CGFloat
    ) {
        if let constraint = (self.constraints.filter { $0.firstAttribute == attribute }.first) {
          constraint.constant = constant
          layoutIfNeeded()
        }
    }
    
}

// MARK: - IBInspectable
extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
          return layer.cornerRadius
        }
        set {
          layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
          return layer.borderWidth
        }
        set {
          layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
          if let color = layer.borderColor {
            return UIColor(cgColor: color)
          }
          return nil
        }
        set {
          if let color = newValue {
            layer.borderColor = color.cgColor
          } else {
            layer.borderColor = nil
          }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
          return layer.shadowRadius
        }
        set {
          layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
          return layer.shadowOpacity
        }
        set {
          layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
          return layer.shadowOffset
        }
        set {
          layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
          if let color = layer.shadowColor {
            return UIColor(cgColor: color)
          }
          return nil
        }
        set {
          if let color = newValue {
            layer.shadowColor = color.cgColor
          } else {
            layer.shadowColor = nil
          }
        }
    }
}

