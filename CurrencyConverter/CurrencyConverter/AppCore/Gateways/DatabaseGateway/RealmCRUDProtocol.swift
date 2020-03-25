//
//  RealmCRUDProtocol.swift
//  CurrencyConverter
//
//  Created by Joe Lorenz Florentino on 3/22/20.
//  Copyright © 2020 Joe Lorenz Florentino. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmCRUDProtocol {
    func update<T: Object>(_ entity: T)
    func delete<T: Object>(_ entity: T)
    func deleteAll<T: Object>(_ entity: T.Type)
    func getEntity<T: Object>(entity: T.Type, identifier: Int) -> T?
    func getEntity<T: Object>(entity: T.Type, identifier: String) -> T?
    func getAllEntities<T: Object>(ofType: T.Type) -> Results<T>?
}

extension RealmCRUDProtocol {
    
    func update<T: Object>(_ entity: T) {
        let realm = try! Realm()
        try! realm.write({
            realm.add(entity, update: .modified)
        })
    }
    
    func delete<T: Object>(_ entity: T) {
        let realm = try! Realm()
        try! realm.write({
            realm.delete(entity)
        })
    }
    
    func deleteAll<T: Object>(_ entity: T.Type) {
        guard let allObjects = getAllEntities(ofType: T.self)
            else { return }
        
        let realm = try! Realm()
        try! realm.write({
            realm.delete(allObjects)
        })
    }
    
    func removeAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func getEntity<T: Object>(entity: T.Type, identifier: Int) -> T? {
        let predicate: NSPredicate
        let keyPath = "id"
        predicate = NSPredicate(format: "%K == %d", keyPath, identifier)
        
        return getEntity(entity: T.self, predicate: predicate)
    }
    
    func getEntity<T: Object>(entity: T.Type, identifier: String) -> T? {
        let predicate: NSPredicate
        let keyPath = "id"
        predicate = NSPredicate(format: "%K == %@", keyPath, identifier)
        
        return getEntity(entity: T.self, predicate: predicate)
    }
    
    func getAllEntities<T: Object>(ofType: T.Type) -> Results<T>? {
        do {
            return try Realm().objects(T.self)
        } catch {
            return nil
        }
    }
}

// MARK; -Private
extension RealmCRUDProtocol {
    fileprivate func getEntity<T: Object>(entity: T.Type, predicate: NSPredicate) -> T? {
        do {
            return try Realm().objects(T.self).filter(predicate).first
        } catch {
            return nil
        }
    }
}
