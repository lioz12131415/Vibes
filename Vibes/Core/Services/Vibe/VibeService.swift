//
//  VibeService.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

protocol VibeService {
    func fetchAll() async throws -> [Vibe]
}
