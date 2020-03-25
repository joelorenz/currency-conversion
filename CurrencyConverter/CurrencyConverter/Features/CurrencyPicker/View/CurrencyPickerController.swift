//
//  CurrencyPickerController.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit
import ReactiveSwift

protocol CurrencyPickerControllerDelegate: class {
    
    func currencyPicker(
        _ picker: CurrencyPickerController,
        didTapCurrency currency: Currency,
        scheme: CurrencyDataScheme
    )
    
}

class CurrencyPickerController: UIViewController {

    // MARK: - @Properties - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - @Properties - Injections
    var viewModel: CurrencyPickerViewModelProtocol!
    
    // MARK: - @Properties - Public
    weak var delegate: CurrencyPickerControllerDelegate?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bind()
        
        viewModel.viewIsReady()
    }

}

// MARK: - StoryboardLoadable
extension CurrencyPickerController: StoryboardLoadable { }

// MARK: - UITextFieldDelegate
extension CurrencyPickerController: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let currentText = textField.text ?? ""
    guard let stringRange = Range(range, in: currentText) else { return false }
    let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
    
    viewModel.search(updatedText)
    
    return true
  }
}

// MARK: - UITableViewDataSource
extension CurrencyPickerController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CurrencyPickerCell.defaultReuseIdentifier,
            for: indexPath
        ) as! CurrencyPickerCell
        
        cell.configure(viewModel.dataSource[indexPath.row])
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension CurrencyPickerController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let currency = viewModel.getCurrency(at: indexPath.row) else { return }
        
        let scheme = viewModel.selectedScheme
        
        self.delegate?.currencyPicker(self, didTapCurrency: currency, scheme: scheme)
        
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Private Methods
private extension CurrencyPickerController {
    
    func bind() {
        tableView.reactive.reloadData <~ viewModel.reloadData
    }
    
}
