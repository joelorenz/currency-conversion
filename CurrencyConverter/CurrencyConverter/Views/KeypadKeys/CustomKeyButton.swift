//
//  CustomKeyButton.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit
import ReactiveSwift

class CustomKeyButton: DesignableView {

    typealias KeypadButtonValue = String
    
    // MARK: - @Properties - IBOutlet
    @IBOutlet weak var keyButton: UIButton!
    
    // MARK: - @Properties - Signals
    let keyTapped = Signal<KeypadButtonValue, Never>.pipe()
    
    // MARK: - @Properties - Value
    var value: KeypadButtonValue = ""
    
}

// MARK: - Nib Loading
extension CustomKeyButton {
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
      if self.subviews.count == 0 {
        let realView = CurrencyButton.nib()
        // pass properties through
        setupRealView(view: realView)
        
        realView.backgroundColor = .clear
        realView.tag = tag
        
        setup(templateView: self, realView: realView)
        
        return realView
      }
      
      return self
    }
    
    override func awakeFromNib() {
      super.awakeFromNib()
    }
    
}

// MARK: - IBAction
extension CustomKeyButton {
    
    @IBAction func didTapButton(_ sender: Any) {
        
        keyTapped.input.send(value: value)
        
    }
    
}
