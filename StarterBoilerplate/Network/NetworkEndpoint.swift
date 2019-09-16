//
//  NetworkEndpoint.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import UIKit

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}

enum RepositoryEndPoint {
    case fetchRepositories(term: String)
}

extension RepositoryEndPoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: Constants.Api.apiUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .fetchRepositories:
            return Constants.Api.endpoint
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .fetchRepositories: return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .fetchRepositories(let term):
            let urlParameters: [String: String] = ["q": "\(term)+language:swift", "sort": "stars", "order": "desc"]
            return .requestParameters(bodyEncoding: .urlEncoding,
                                      urlParameters: urlParameters)
        }
    }
}
