//
//  VibeWidget+Entry.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI
import WidgetKit

extension VibeWidget {
    struct Entry: TimelineEntry {
        let date:          Date
        let vibeEntity:    VibeEntity?
        let recordsEntity: RecordsEntity
        let displayStyle:  DisplayStyle
    }
}

extension VibeWidget.Entry {
    enum DisplayStyle {
        case standard
        case animated
    }
}
