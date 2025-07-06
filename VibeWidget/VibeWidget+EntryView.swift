//
//  VibeWidget+EntryView.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI
import WidgetKit

extension VibeWidget {
    struct EntryView: View {

        var entry: Provider.Entry
        
        var body: some View {
            ZStack {
                if let entity = entry.vibeEntity,
                   let vibe   = entity.vibe {
                    VStack(spacing: 2) {
                        
                        switch entry.displayStyle {
                            case .standard: EmojiText(emoji: vibe.emoji)
                            case .animated: AnimatedEmojiText(emoji: vibe.emoji)
                        }
                        
                        Text(vibe.label)
                            .font(.title3)
                            .contentTransition(.numericText())
                            .minimumScaleFactor(0.1)
                        
                        Text("You’ve picked \(entry.recordsEntity.count) vibes this week.")
                            .contentTransition(.numericText())
                            .minimumScaleFactor(0.1)

                    }
                } else {
                    Text("No vibe yet — pick one!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .widgetURL(URL(string: "vibes://open?screen=vibe")!)
                        
        }
    }
}
