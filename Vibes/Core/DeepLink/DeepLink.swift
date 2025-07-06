//
//  DeepLink.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import Foundation

final
class DeepLink<R: Route> {
    
    private var url: URL
    
    internal init(_ url: URL) {
        self.url = url
    }
    
    internal func parse(_ action: (R) -> Void) {
        guard url.absoluteString.hasPrefix("vibes://") else {
            return
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return
        }
        guard let first = components.queryItems?.first?.value else {
            return
        }
        guard let route = R(rawValue: first) else {
            return
        }
        action(route)
    }
}
