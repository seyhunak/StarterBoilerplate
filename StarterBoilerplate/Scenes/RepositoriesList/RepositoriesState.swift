//
//  RepositoriesState.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation

struct RepositoryViewState {
    fileprivate(set) var fetching = false
    var items: [Item] = []
}

extension RepositoryViewState {
    enum Change {
        case items
        case fetchStateChanged(isFetching: Bool)
        case error(message: String?)
    }
    
    mutating func setFetching(fetching: Bool) -> Change {
        self.fetching = fetching
        return .fetchStateChanged(isFetching: fetching)
    }
    
    mutating func setItems(_ items: [Item]) -> Change {
        self.items = items
        return .items
    }
}
