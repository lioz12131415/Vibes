//
//  VibesApp.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI

@main
struct VibesApp: App {
    
    @StateObject private var vibesRouter = Router<VibesRoute>()
    
    var body: some Scene {
        WindowGroup {
            VibesView()
                .environmentObject(vibesRouter)
        }
    }
}
