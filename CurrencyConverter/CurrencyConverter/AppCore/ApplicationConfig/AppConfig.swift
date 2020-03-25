//
//  AppConfig.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

struct AppConfig {
    private let config: String
    private let rootPlist: [String: Any]?
    private var buildEnvironment = BuildEnvironment.development
    
    private var backend: [String: Any]? { rootPlist?["Backend"] as? [String: Any] }
    
    private var appState: [String: Any]? { rootPlist?["AppState"] as? [String: Any] }
    
    private var uriList = [String: ApiMethodInfo?]()
    
    init() {
        let bundle = Bundle.main
        config = bundle.infoDictionary?["Configuration"] as! String
        
        print("Config-\(self.config)")
        
        let path  = bundle.path(forResource: "Config-\(self.config)", ofType: "plist") ?? ""
        rootPlist = NSDictionary(contentsOfFile: path) as? [String: Any]
        
        uriList = getURIList()
    }
    
}

// MARK: - ApplicationConfigurable
extension AppConfig: ApplicationConfigurable {
    
    var environment: BuildEnvironment {
        switch config {
        default:
            return .development
        }
    }
    
    var apiAccessKey: String { backend?["apiAccessKey"] as? String ?? "" }
    
    var uri: [String: ApiMethodInfo?] { uriList }
    
    var isNetworkLoggingEnabled: Bool { appState?["NetworkLoggingEnabled"] as? Bool ?? false }
    
    var isDeviceLoggingEnabled: Bool { appState?["NetworkLoggingEnabled"] as? Bool ?? false }
    
    func baseURL(type: BaseURLType) -> String {
        guard let url = backend?[type.description] as? String else { return "" }
        
        return  url
    }
}

// MARK: - Private Methods
private extension AppConfig {
    
    func getURIList() -> [String: ApiMethodInfo?] {
        guard let rawURIList = backend?["URI"] as? [String: AnyObject] else { return [:] }
        
        let decoder = DictionaryDecoder()
        var uriList = [String: ApiMethodInfo?]()
        
        for (key, value) in rawURIList {
            if let value = value as? [String: Any] {
                do {
                    uriList[key] = try decoder.decode(URIDetails.self, from: value)
                } catch {
                    AppDebug.LogError.record(error)
                }
            }
        }
        
        return  uriList
    }
}
