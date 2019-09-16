//
//  RepositoriesViewModel.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation

final class RepositoryTableViewModel {
    
    var state = RepositoryViewState()
    var changeHandler: ((RepositoryViewState.Change) -> Void)?

    var numberOfItems: Int {
        return state.items.count
    }
    
    func itemAtIndex(_ index: Int) -> Item? {
        if state.items.count > index {
            return state.items[index]
        }
        return nil
    }

    private let networkManager: NetworkManager
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchRepositories(term: String) {
        NetworkManager.shared.fetchRespositories(term: term, completion: { (result) in
            self.changeHandler?(self.state.setFetching(fetching: false))
            self.changeHandler?(self.state.setItems(result.items!))
        }) { (error) in
            self.changeHandler?(.error(message: error))
            self.changeHandler?(self.state.setFetching(fetching: false))
        }
    }
}
