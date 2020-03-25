//
//  APIClient.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

enum Response<Value> {
    case success(Value)
    case failure(Error)
}

enum ParameterEncoding {
    case url, json
}

struct ResponseData<Value> {
    var result: Response<Value>
}

protocol APIClient {
    
    var appConfig: ApplicationConfigurable { get set }
    
    func request<Value: APIModel>(
        _ baseURLType: BaseURLType,
        uri URIDetails: ApiMethodInfo,
        params:[String : Any]?,
        encoding: ParameterEncoding,
        responseHandler: @escaping(_ response: ResponseData<Value>) -> ()
    )
    
}

extension APIClient {
    
    // MARK: Get URI Details from URI Method Type
    func getURIDetails(apiMethod method: ApiMethod) -> ApiMethodInfo? {
        return appConfig.uri[method.rawValue] ?? nil
    }
    
    // MARK:- ---Log Request ----------
    func logRequest<T: APIModel>(paramsModel model: T, request: String) {
        if appConfig.isNetworkLoggingEnabled {
            print("\nRequest: \(request)")
            print("\n\(model.json() ?? "\(request): No Request")")
        }
    }
    
}
