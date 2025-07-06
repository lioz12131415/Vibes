//
//  RecordsEntity.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

struct RecordsEntity: Codable, Hashable {
    internal var count: Int = 0
}

extension RecordsEntity {
    internal static var empty: RecordsEntity {
        return RecordsEntity()
    }
}

extension RecordsEntity {
    internal static var mock: RecordsEntity {
        return RecordsEntity(count: 1)
    }
}
