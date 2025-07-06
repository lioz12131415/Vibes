//
//  VibeNavigation.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI

struct VibeNavigation<Content: View>: View {
    
    private var content: Content
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            content
                .toolbarBackground(
                    Color(.systemBackground), for: .navigationBar
                )
                .navigationBarTitle(
                    "", displayMode: .inline
                ).toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(Color(.label))
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
        }
    }
    
    internal init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    VibeNavigation {
        Color(.systemBackground)
    }
}


