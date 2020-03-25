//
//  HomeController.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class HomeController: UIViewController {

    // MARK: - @Properties - IBOutlets
    @IBOutlet weak var conversionTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sourceCurrencyButton: CurrencyButton!
    @IBOutlet weak var targetCurrencyButton: CurrencyButton!
    @IBOutlet weak var keypadContainer: UIView!
    
    // MARK: - @Properties - Injections
    var viewModel: HomeViewModelProtocol!
    
    // MARK: - @Properties - Private
    private var numericKeypad: CustomKeypad!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        bind()
        
        setup()
        
        viewModel.viewIsReady()
    }
    
}

// MARK: - StoryboardLoadable
extension HomeController: StoryboardLoadable { }

// MARK: - IBAction
extension HomeController {
    
    @IBAction func didTapSwap(_ sender: Any) {
        viewModel.didSelectSwapButton()
    }
    
}

// MARK: - Setup
private extension HomeController {
    
    // MARK: - ViewModel Binding
    func bind() {
        conversionTextField.reactive.text <~ viewModel.inputValue
        resultLabel.reactive.text <~ viewModel.convertedValue
        
        viewModel.sourceCurrency.listener
            .observe(on: UIScheduler())
            .observeValues { [weak self](currency) in
                self?.sourceCurrencyButton.configure(currency)
        }
        
        viewModel.targetCurrency.listener
            .observe(on: UIScheduler())
            .observeValues { [weak self](currency) in
                self?.targetCurrencyButton.configure(currency)
        }
    }
    
    // MARK: - Setup UI
    func setup() {
        setupTextField()
        setupKeypad()
        
        sourceCurrencyButton.scheme = .source
        targetCurrencyButton.scheme = .target
        
        setupObservables()
    }
    
    func setupTextField() {
        conversionTextField.inputView = UIView()
        conversionTextField.becomeFirstResponder()
        conversionTextField.adjustsFontSizeToFitWidth = true
        
        conversionTextField.becomeFirstResponder()
    }
    
    func setupKeypad() {
        numericKeypad = CustomKeypad()
        numericKeypad.delegate = self
        
        keypadContainer.addSubview(numericKeypad)
        
        numericKeypad.pin()
    }
    
    func setupObservables() {
        sourceCurrencyButton.update
            .output
            .observeValues { [weak self] (scheme) in
                self?.viewModel.didSelectCurrencyButton(with: scheme)
        }
        
        targetCurrencyButton.update
            .output
            .observeValues { [weak self] (scheme) in
                self?.viewModel.didSelectCurrencyButton(with: scheme)
        }
    }
    
}

// MARK: - CustomKeypadDelegate
extension HomeController: CustomKeypadDelegate {
    
    func customKeypad(_ view: CustomKeypad, didTapKey key: String) {
        viewModel.setInput(text: key)
    }
    
}
