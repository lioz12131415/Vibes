//
//  VibesView+ViewModel.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Combine
import Foundation

extension VibesView {
    @MainActor
    final class ViewModel: ObservableObject {
        
        fileprivate var service:      VibeService
        fileprivate var storage:      VibeStorage
        fileprivate var cancellables: Set<AnyCancellable> = []
        
        @Published private(set) var vibes:   [Vibe] = []
        @Published private(set) var selected: Vibe?
        
        internal init(service: VibeService, storage: VibeStorage) {
            self.service = service
            self.storage = storage
            
            self.storage.publisher
                .receive(on: RunLoop.main)
                .assign(to: &$selected)
        }
        
        internal func pick(_ vibe: Vibe) {
            self.storage.pick(vibe)
        }
        
        internal func fetchAll() async {
            self.vibes = (try? await service.fetchAll()) ?? []
        }
        
        internal func loadStorage() async {
            await storage.load()
        }
    }
}
