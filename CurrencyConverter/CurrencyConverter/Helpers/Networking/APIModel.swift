//
//  APIModel.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/21/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation

protocol APIModel: Codable {

    /// Returns a JSONDecoder instance that's configured for the conforming type.
    static func decoder() -> JSONDecoder
    
    /// Returns a JSONEncoder instance that's configured for the conforming type.
    static func encoder() -> JSONEncoder
  
}

// MARK: - Decodable - Default implementations
extension APIModel {
  
    static func decoder() -> JSONDecoder {
        return JSONDecoder()
    }
  
    static func decode(_ data: Data) throws -> Self {
        return try decoder().decode(self, from: data)
    }
  
    static func decode(_ dictionary: [String: Any]) throws -> Self {
        return try decode(try JSONSerialization.data(withJSONObject: dictionary))
    }
  
}

// MARK: - Encodable
extension APIModel {
    static func encoder() -> JSONEncoder {
        return JSONEncoder()
    }
    
    func encode() throws -> Data {
        return try Self.encoder().encode(self)
    }
    
    func dictionary() -> [String: Any]? {
        do {
            if let dict = try JSONSerialization.jsonObject(
                with: try encode(),
                options: .allowFragments
            ) as? [String: Any] {
                return dict.filter { !($0.value is NSNull) }
            }
        } catch {
            AppDebug.LogError.record(error)
        }
        return nil
    }
    
    func json() -> String? {
        do {
            return String(data: try encode(), encoding: .utf8)
        } catch {
            AppDebug.LogError.record(error)
            return nil
        }
    }
  
}
