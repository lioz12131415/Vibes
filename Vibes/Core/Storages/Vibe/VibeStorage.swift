//
//  VibeStorage.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Combine
import Foundation

protocol VibeStorage {
    func load() async
    func picked() -> Vibe?
    func pick(_ vibe: Vibe)
    func contains(_ vibe: Vibe) -> Bool
    
    var isEmpty:   Bool { get }
    var publisher: AnyPublisher<Vibe?, Never> { get }
}

