//
//  CurrencyButton.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit
import ReactiveSwift

class CurrencyButton: DesignableView {
    
    // MARK: - @Properties - IBOutlet
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var flagIcon: UIImageView!
    
    // MARK: - @Properties - Signals
    let update = Signal<CurrencyDataScheme, Never>.pipe()
    
    // MARK: - @Properties - Public
    var scheme: CurrencyDataScheme = .target
    
}

// MARK: - Tappable
extension CurrencyButton: Tappable { }

// MARK: - Nib Loading
extension CurrencyButton {
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        if self.subviews.count == 0 {
            let realView = CurrencyButton.nib()
            // pass properties through
            setupRealView(view: realView)
            
            realView.tag = tag
            
            setup(templateView: self, realView: realView)
            
            return realView
        }
        
        return self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
}

// MARK: - Setup
extension CurrencyButton {
    
    func setupView() {
        addGestureToView(
            self,
            target: self,
            selector: #selector(didTapSelectView),
            cancelTouches: true
        )
    }
    
    func configure(_ code: String) {
        currencyLabel.text = code.uppercased()
        flagIcon.image = UIImage(named: code.lowercased())
    }
    
}

// MARK: - Action
@objc extension CurrencyButton {
    
    func didTapSelectView() {
        update.input.send(value: scheme)
    }
    
}
