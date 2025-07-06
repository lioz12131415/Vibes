//
//  VibeHeader.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI
import Foundation

struct VibeHeader: View {
    
    internal let vibe: Vibe?

    var body: some View {
        if let vibe = vibe {
            VStack {
                Text(vibe.emoji)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .padding(.horizontal, 8)
                
                Text("Your vibe today: \(vibe.emoji) \(vibe.label)!")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.horizontal)
            }
            .aspectRatio(1.0, contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        } else {
            Text("Error loading vibe data...")
        }
    }
}
