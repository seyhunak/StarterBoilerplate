//
//  RepositoriesRouter.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import UIKit

enum RepositoriesListRoute: Equatable {
    static func == (lhs: RepositoriesListRoute, rhs: RepositoriesListRoute) -> Bool {
        return true
    }
    
    case detail(Item)
}

protocol RepositoriesListRouterProtocol: class {
    func navigate(to route: RepositoriesListRoute)
}

final class RepositoriesDetailBuilder {
    static func make(with item: Item) -> RepositoryDetailViewController {
        let viewController = RepositoryDetailViewController.instantiate()
        viewController.item = item
        return viewController
    }
}

final class RepositoriesRouter: RepositoriesListRouterProtocol {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: RepositoriesListRoute) {
        switch route {
        case .detail(let item):
            let detailView = RepositoriesDetailBuilder.make(with: item)
            view.show(detailView, sender: nil)
        }
    }
}
