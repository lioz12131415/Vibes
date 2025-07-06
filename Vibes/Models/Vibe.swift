//
//  Vibe.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

struct Vibe: Codable, Identifiable, Hashable {
    
    internal let emoji: String
    internal let label: String
    
    internal var id: String {
        return label
    }
    
    internal static func ==(lhs: Vibe, rhs: Vibe) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Vibe {
    internal static var mock: Vibe {
        return Vibe(emoji: "🧠", label: "Focus")
    }
}
