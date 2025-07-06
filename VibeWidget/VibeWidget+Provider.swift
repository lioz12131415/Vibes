//
//  VibeWidget+Provider.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI
import WidgetKit

extension VibeWidget {
    struct Provider: TimelineProvider {
        
        fileprivate var storage: AppGroupStorage = {
            return AppGroupStorage(group: "group.com.lioz.balki.vibes")
        }()
        
        func placeholder(in context: Context) -> Entry {
            return entry()
        }

        func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
            completion(entry())
        }

        func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
            completion(Timeline(entries: [entry()], policy: .never))
        }
        
        fileprivate func entry() -> Entry {
            let values = entities()
            return Entry(
                date:          .now,
                vibeEntity:    values.vibeEntity,
                recordsEntity: values.recordsEntity,
                displayStyle:  values.recordsEntity.count % 7 == 0 ? .animated : .standard
            )
        }
        
        fileprivate func entities() -> (vibeEntity: VibeEntity?, recordsEntity: RecordsEntity) {
            let vibeEntity:    VibeEntity?    = storage.get(for: "vibe.entity")
            let recordsEntity: RecordsEntity? = storage.get(for: "vibe.records.entity")
            return (vibeEntity, recordsEntity ?? .empty)
        }
    }
}

