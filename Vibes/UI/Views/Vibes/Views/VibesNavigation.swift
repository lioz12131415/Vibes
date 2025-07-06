//
//  VibesNavigation.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI

struct VibesNavigation<Content: View, Dest: View>: View {
    
    typealias Destination = (VibesRoute) -> Dest
        
    private var content:     Content
    private let destination: Destination?
    
    @EnvironmentObject private var router: Router<VibesRoute>
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: VibesRoute.self) { route in
                    destination?(route)
                }
                .toolbarBackground(
                    Color(.systemBackground), for: .navigationBar
                )
                .navigationBarTitle(
                    Date().ordinalDayMonthYear(), displayMode: .inline
                )
        }
    }
    
    internal init(@ViewBuilder content: () -> Content,
                  @ViewBuilder destination: @escaping(VibesRoute) -> Dest) {
        self.content = content()
        self.destination = destination
    }
}

#Preview {
    VibesNavigation {
        Color(.systemBackground)
    } destination: { route in
        
    }
    .environmentObject(Router<VibesRoute>())
}

