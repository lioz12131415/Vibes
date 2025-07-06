//
//  VibeView.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI

struct VibeView: View {
    
    internal let vibe: Vibe?
    
    var body: some View {
        VibeNavigation {
            VibeHeader(vibe: vibe)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    VibeView(vibe: .mock)
}

