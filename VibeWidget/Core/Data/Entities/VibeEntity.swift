//
//  VibeEntity.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

struct VibeEntity: Decodable, Hashable {
    internal var date: Date
    internal var vibe: Vibe?
}

extension VibeEntity {
    internal static var mock: VibeEntity {
        return VibeEntity(date: .now, vibe: .mock)
    }
}
