//
//  APIResponseModel.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

protocol Currency {
    
    var name: String { get }
    var code: String { get }
    
    init(copy obj: Currency)
}

extension Currency {

    func toDTO() -> CurrencyDTO {
        return CurrencyDTO(copy: self)
    }
    
    func toRealm() -> RealmCurrency {
        return RealmCurrency(copy: self)
    }
    
    func toAPIModel() -> APICurrency {
        return APICurrency(copy: self)
    }
    
}
