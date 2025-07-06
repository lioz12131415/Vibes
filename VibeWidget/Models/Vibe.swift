//
//  Vibe.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

struct Vibe: Decodable, Hashable {
    internal let emoji: String
    internal let label: String
}

extension Vibe {
    internal static var mock: Vibe {
        return Vibe(emoji: "🧠", label: "Focus")
    }
}
