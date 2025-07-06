//
//  Data+Extensions.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

extension Data {
    internal init(file name: String, bundle: Bundle = .main) throws {
        guard let file = bundle.url(forResource: name, withExtension: "json") else {
            throw URLError(.badURL)
        }
        try self.init(contentsOf: file)
    }
}
