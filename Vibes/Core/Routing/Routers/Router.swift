//
//  Router.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import SwiftUI
import Foundation

final
class Router<R: Route>: ObservableObject {
    
    @Published var path = [R]()
    
    internal var pick: R? {
        return path.last
    }
    
    internal func pop() {
        self.path.removeLast()
    }
    
    internal func popToRootView() {
        self.path.removeLast(path.count)
    }
    
    internal func push(_ route: R) {
        self.path.append(route)
    }
}

