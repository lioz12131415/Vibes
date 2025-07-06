//
//  AnimatedEmojiText.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI
import Foundation

struct AnimatedEmojiText: View {
    
    internal let emoji: String
    
    var body: some View {
        EmojiText(emoji: emoji)
            .clockHandRotationEffect(period: 1)
            .offset(x: 10, y: 0)
            .clockHandRotationEffect(period: -5)
    }
}
