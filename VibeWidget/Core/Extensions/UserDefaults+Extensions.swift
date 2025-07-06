//
//  UserDefaults+Extensions.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

extension UserDefaults {
    internal func decode<T: Decodable>(for key: String) -> T? {
        guard let data = data(forKey: key) else {
            return nil
        }
        return try? T.decode(data)
    }
}

extension UserDefaults {
    internal func encode<T: Encodable>(_ object: T, for key: String) {
        guard let data = try? JSONEncoder().encode(object) else {
            return
        }
        self.set(data, forKey: key)
    }
}
