//
//  CurrencyPickerCell.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/23/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import UIKit

class CurrencyPickerCell: UITableViewCell {

    // MARK: - @Properties - IBOutlet
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - Nib Loading
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ viewModel: CurrencyPickerCellViewModel) {
        codeLabel.text = viewModel.currencyCode
        currencyNameLabel.text = viewModel.currencyName
        resultLabel.text = viewModel.convertedValue
        infoLabel.text = viewModel.info
    }

}

// MARK: - NibCellReusable
extension CurrencyPickerCell: NibCellReusable { }
