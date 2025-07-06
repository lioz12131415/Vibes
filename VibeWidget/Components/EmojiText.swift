//
//  EmojiText.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI
import Foundation

struct EmojiText: View {
    
    internal let emoji: String
    
    var body: some View {
        Text(emoji)
            .font(.system(size: 1_000))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .minimumScaleFactor(0.01)
            .padding(.horizontal, 8)
    }
}
