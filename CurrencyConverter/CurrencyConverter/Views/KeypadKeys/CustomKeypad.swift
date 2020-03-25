//
//  CustomKeypad.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

protocol CustomKeypadDelegate: class {
    
    func customKeypad(_ view: CustomKeypad, didTapKey key: String)
    
}

class CustomKeypad: UIView {
    
    weak var delegate: CustomKeypadDelegate?
    
    // MARK: - @Properties - Private
    private var keyButtons = KeypadGenerator.NumericKeypad.generate()
    
    // MARK: - Initializer
    init() {
        super.init(frame: .zero)
        
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private Methods
private extension CustomKeypad {
    
    var arrangeKeyButtons: [[CustomKeyButton]] {
        return keyButtons.chunked(by: 3)
    }
    
    func configureAppearance() {
        backgroundColor = .clear
        
        let columnStackView = UIStackView()
        columnStackView.distribution = .fillEqually
        columnStackView.axis = .vertical
        columnStackView.spacing = 0
        
        arrangeKeyButtons.forEach { (rowKeys) in
            let rowStackView = UIStackView()
            rowStackView.distribution = .fillEqually
            rowStackView.axis = .horizontal
            rowStackView.spacing = 0
            
            rowKeys.forEach { (keyButton) in
                setupObservable(for: keyButton)
                rowStackView.addArrangedSubview(keyButton)
            }
            
            columnStackView.addArrangedSubview(rowStackView)
        }
        
        addSubview(columnStackView)
        
        columnStackView.pin()
        
    }
    
    func setupObservable(for keyButton: CustomKeyButton) {
        keyButton.keyTapped.output.observeValues { [weak self](value) in
            guard let self = self else { return }
            
            self.delegate?.customKeypad(self, didTapKey: value)
        }
    }
    
}
