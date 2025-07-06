//
//  VibeDefaultStorage.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Combine
import Foundation

final
class VibeDefaultStorage: WidgetStorage, VibeStorage {
    
    fileprivate var entity:  VibeEntity?
    fileprivate var records: RecordsEntity?
    
    fileprivate static let shared: VibeDefaultStorage = {
        return VibeDefaultStorage(kind: "VibeWidget", group: "group.com.lioz.balki.vibes")
    }()
    
    fileprivate let subject: CurrentValueSubject<Vibe?, Never> = {
        return CurrentValueSubject(nil)
    }()
    
    internal var isEmpty: Bool {
        return entityUnlessExpired()?.vibe == nil
    }
    
    internal var publisher: AnyPublisher<Vibe?, Never> {
        return subject.eraseToAnyPublisher()
    }
    
    internal func load() async {
        self.entity  = get(for: "vibe.entity")
        self.records = get(for: "vibe.records.entity") ?? .empty
        self.subject.send(entityUnlessExpired()?.vibe)
    }
    
    internal func picked() -> Vibe? {
        return entityUnlessExpired()?.vibe
    }
    
    internal func contains(_ vibe: Vibe) -> Bool {
        return entityUnlessExpired()?.vibe == vibe
    }
    
    internal func pick(_ vibe: Vibe) {
        if let entity = entityUnlessExpired(), entity.vibe == vibe {
            return
        }
        self.clear()
        self.subject.send(vibe)
        self.records?.increment()
        self.save(VibeEntity(date: .now, vibe: vibe))
        self.synchronizeAndReloadTimelines()
    }
    
    private func clear() {
        self.entity = nil
        self.subject.send(nil)
        self.delete(for: "vibe.entity")
    }
    
    private func save(_ value: VibeEntity) {
        self.entity = value
        self.save(value,   for: "vibe.entity")
        self.save(records, for: "vibe.records.entity")
    }
    
    private func entityUnlessExpired() -> VibeEntity? {
        guard let entity = entity else {
            return entity
        }
        if entity.isExpired {
            self.clear()
        }
        return entity
    }
}

extension VibeStorage where Self == VibeDefaultStorage {
    internal static var `default`: VibeDefaultStorage {
        return .shared
    }
}
