//
//  LocalURLSession.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

final class LocalURLSession: APIClient {
    
    // MARK: - @Properties - Stored
    var appConfig: ApplicationConfigurable
    
    // MARK: - Initializer
    init(appConfig: ApplicationConfigurable) {
        self.appConfig = appConfig
    }
    
    func request<Value: APIModel>(
        _ baseURLType: BaseURLType,
        uri URIDetails: ApiMethodInfo,
        params: [String: Any]?,
        encoding: ParameterEncoding,
        responseHandler: @escaping (ResponseData<Value>) -> ()
    ) {
        
        let urlRequest = URLRequestComposer(
            baseUrl: appConfig.baseURL(type: baseURLType),
            uri: URIDetails,
            parameters: params,
            encoding: encoding
        ).compose
        
        let session: URLSession = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            GCDUtil.Main.async {
                if let error = error {
                    responseHandler(ResponseData(result: .failure(error)))
                } else {
                    if let _data = data {
                        print(String(decoding: _data, as: UTF8.self))
                        
                        do {
                            let response = try JSONDecoder().decode(Value.self, from: _data)
                            responseHandler(ResponseData(result: .success(response)))
                        } catch {
                            responseHandler(ResponseData(result: .failure(error)))
                        }
                    }
                    
                    
                }
            }
        }
        
        task.resume()
    }
    
}
