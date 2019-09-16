//
//  NetworkManager.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation

protocol NetworkRouter {
    associatedtype EndPoint: EndPointType
    func request(_ target: EndPoint, completion: @escaping NetworkServiceCompletion)
    func cancel()
}

struct NetworkManager {
    static let shared = NetworkManager()
    let provider = NetworkService<RepositoryEndPoint>()

    func fetchRespositories(term: String, completion: @escaping ClosureType<Repository>, failure: @escaping Failure) {
        provider.request(.fetchRepositories(term: term), model: Repository.self, completion: completion, failure: failure)
    }
}
