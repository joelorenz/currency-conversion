//
//  ServerGateway.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import ReactiveSwift

final class ServerGateway {
    let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func signalProducer<Value: APIModel & Decodable>(
        baseURL: BaseURLType,
        uri: ApiMethodInfo,
        params:[String : Any]? = nil,
        encoding: ParameterEncoding = .url
    ) -> SignalProducer<Value, HTTPError> {
        return SignalProducer { [unowned self] (observer, _) in
            self.apiClient.request(
                baseURL,
                uri: uri,
                params: params,
                encoding: encoding
            ) { (response: ResponseData<Value>) in
                switch response.result {
                case .success(let value):
                    observer.send(value: value)
                case .failure(let error):
                    switch error {
                    case let httpError as HTTPError:
                        observer.send(error: httpError)
                    default:
                        observer.send(error: HTTPError(error))
                    }
                }
            }
        }
    }
    
}

// MARK: - Helper Methods
extension ServerGateway {
    
    func errorNilSignal<Value>(
        code: HTTPStatusCode = .uriMethodNotFound
    ) -> SignalProducer<Value, HTTPError> {
        return SignalProducer { (observer, _) in
            observer.send(error: HTTPError(code) )
            observer.sendCompleted()
        }
    }
    
}
