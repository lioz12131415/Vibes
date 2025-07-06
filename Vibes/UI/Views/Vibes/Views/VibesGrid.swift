//
//  VibesGrid.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI

struct VibesGrid: View {
    
    internal let vibes:     [Vibe]
    internal let selected:   Vibe?
    internal let onSelected: ((Vibe) -> Void)?
    
    @EnvironmentObject private var router: Router<VibesRoute>
    
    private var columns: [GridItem] = [
        .init(.flexible(), spacing: 20),
        .init(.flexible(), spacing: 20),
        .init(.flexible(), spacing: 20),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(vibes) { vibe in
                VibesItem(vibe: vibe, isSelected: selected == vibe)
                    .onTapGesture { onSelected?(vibe) }
            }
        }.onOpenURL { url in
            DeepLink<VibesRoute>(url).parse { route in
                switch router.pick {
                    case let p where p != .vibe: router.push(.vibe)
                default:
                    break
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    internal init(vibes: [Vibe],
                  selected: Vibe? = nil, onSelected: ((Vibe) -> Void)? = nil) {
        self.vibes      = vibes
        self.selected   = selected
        self.onSelected = onSelected
    }
}

#Preview {
    VibesGrid(vibes: [
        Vibe(emoji: "🧠", label: "Focus"),
        Vibe(emoji: "💪", label: "Power"),
        Vibe(emoji: "😴", label: "Chill")
    ])
}

