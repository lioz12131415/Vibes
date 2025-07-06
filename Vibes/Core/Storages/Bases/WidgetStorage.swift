//
//  WidgetStorage.swift
//  ¯\_(ツ)_/¯
//
//  Created by Lioz Balki on 01/01/1970.
//

import WidgetKit
import Foundation

class WidgetStorage: AppGroupStorage {
    
    fileprivate var kind: String = .init()
    
    private override init(group: String) {
        super.init(group: group)
    }
    
    internal init(kind: String, group: String) {
        self.kind = kind
        super.init(group: group)
    }
    
    final
    internal func reloadTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: kind)
    }
    
    final
    internal func synchronizeAndReloadTimelines() {
        self.synchronize()
        self.reloadTimelines()
    }
}

