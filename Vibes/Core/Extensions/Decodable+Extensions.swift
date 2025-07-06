//
//  Decodable+Extensions.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

extension Decodable {
    internal static func decode(_ data: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
