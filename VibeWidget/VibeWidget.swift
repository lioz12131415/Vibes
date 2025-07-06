//
//  VibeWidget.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI
import WidgetKit
import ClockHandRotationEffect

struct VibeWidget: Widget {
    
    let kind: String = "VibeWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider:  Provider()) { entry in
            if #available(iOS 17.0, *) {
                EntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                EntryView(entry: entry)
                    .background()
                    .padding()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#if canImport(SwiftUI)
@available(iOSApplicationExtension 17.0, *)
#Preview(as: .systemSmall) {
    VibeWidget()
} timeline: {
    VibeWidget.Entry(
        date: .now,
        vibeEntity: nil,
        recordsEntity: .empty,
        displayStyle: .standard
    )
    VibeWidget.Entry(
        date: .now,
        vibeEntity: .mock,
        recordsEntity: .mock,
        displayStyle: .standard
    )
    VibeWidget.Entry(
        date: .now,
        vibeEntity: .mock,
        recordsEntity: .mock,
        displayStyle: .animated
    )
}
#endif

