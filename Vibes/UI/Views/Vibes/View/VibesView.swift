//
//  VibesView.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI

struct VibesView: View {
    
    @EnvironmentObject private var router: Router<VibesRoute>
    
    @StateObject
    private var viewModel: ViewModel = {
        return ViewModel(service: .mock, storage: .default)
    }()
    
    var body: some View {
        VibesNavigation {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea(.all, edges: .bottom)
                ScrollView {
                    VibesHeader()
                    VibesGrid(
                        vibes: viewModel.vibes,
                        selected: viewModel.selected,
                        onSelected: { vibe in
                            viewModel.pick(vibe)
                            router.push(.vibe)
                        }
                    )
                    .padding(.top)
                }
            }
        } destination: { route in
            switch route {
                case .vibe: VibeView(vibe: viewModel.selected)
            }
        }.task {
            await viewModel.fetchAll()
            await viewModel.loadStorage()
        }
    }
}

#Preview {
    VibesView()
        .environmentObject(Router<VibesRoute>())
}
