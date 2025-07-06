//
//  VibesItem.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI

struct VibesItem: View {
    
    internal let vibe:       Vibe
    internal let isSelected: Bool
    
    @State private var appear = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                if appear {
                    Text(vibe.emoji)
                        .font(.system(size: 1_000))
                        .minimumScaleFactor(0.01)
                        .padding(.horizontal, 8)
                        .transition(.push(from: .bottom))
                    
                    Text(vibe.label)
                        .font(.title3)
                        .padding(.bottom)
                        .contentTransition(.numericText())
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .background(.ultraThinMaterial)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color(.label) : .clear, lineWidth: 2)
        )
        .aspectRatio(1.0, contentMode: .fit)
        .cornerRadius(20)
        .onAppear {
            withAnimation(.spring(duration: 0.8)) {
                appear = true
            }
        }
    }
}

#Preview {
    VibesItem(vibe: .mock, isSelected: false)
}
