//
//  VibeEntity.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

struct VibeEntity: Codable, Hashable {
    
    internal var date: Date
    internal var vibe: Vibe?
    
    internal var isExpired: Bool {
        return !Calendar.current.isDateInToday(date)
    }
    
    internal func hash(into hasher: inout Hasher) {
        hasher.combine(vibe)
    }
    
    internal static func ==(lhs: VibeEntity, rhs: VibeEntity) -> Bool {
        return lhs.vibe == rhs.vibe
    }
}
