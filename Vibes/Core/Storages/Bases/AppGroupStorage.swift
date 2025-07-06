//
//  AppGroupStorage.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

class AppGroupStorage {
    
    fileprivate var group:    String
    fileprivate var defaults: UserDefaults?
    
    internal init(group: String) {
        self.group    = group
        self.defaults = UserDefaults(suiteName: group)
    }
    
    final
    internal func synchronize() {
        self.defaults?.synchronize()
    }

    final
    internal func delete(for key: String) {
        self.defaults?.removeObject(forKey: key)
    }
    
    final
    internal func get<V: Decodable>(for key: String) -> V? {
        self.defaults?.decode(for: key)
    }
    
    final
    internal func save<V: Encodable>(_ value: V, for key: String) {
        self.defaults?.encode(value, for: key)
    }
}

