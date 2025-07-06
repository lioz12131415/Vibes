//
//  VibeMockService.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

final
class VibeMockService: VibeService {
    internal func fetchAll() async throws -> [Vibe] {
        let data     = try Data(file: "vibes_mock")
        let response = try Response<[Vibe]>.decode(data)
        return response.data
    }
}

extension VibeService where Self == VibeMockService {
    internal static var mock: VibeMockService {
        return VibeMockService()
    }
}
