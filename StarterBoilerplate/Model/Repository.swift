//
//  Repository.swift
//  StarterBoilerplate
//
//  Created by Seyhun Akyürek on 16/09/2019.
//  Copyright © 2019 Seyhun Akyürek. All rights reserved.
//

import Foundation

// MARK: - Repository
struct Repository: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount
        case incompleteResults
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let itemPrivate: Bool?
    let owner: Owner?
    let htmlURL: String?
    let itemDescription: String?
    let fork: Bool?
    let url, forksURL: String?
    let keysURL, collaboratorsURL: String?
    let teamsURL, hooksURL: String?
    let issueEventsURL: String?
    let eventsURL: String?
    let assigneesURL, branchesURL: String?
    let tagsURL: String?
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    let statusesURL: String?
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    let subscriptionURL: String?
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    let contentsURL, compareURL: String?
    let mergesURL: String?
    let archiveURL: String?
    let downloadsURL: String?
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    let labelsURL, releasesURL: String?
    let deploymentsURL: String?
    let createdAt, updatedAt, pushedAt: Date?
    let gitURL, sshURL: String?
    let cloneURL: String?
    let svnURL: String?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: Language?
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
    let hasPages: Bool?
    let forksCount: Int?
    let mirrorURL: JSONNull?
    let archived, disabled: Bool?
    let openIssuesCount: Int?
    let license: License?
    let forks, openIssues, watchers: Int?
    let defaultBranch: DefaultBranch?
    let score: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID
        case name
        case fullName
        case itemPrivate
        case owner
        case htmlURL
        case itemDescription
        case fork, url
        case forksURL
        case keysURL
        case collaboratorsURL
        case teamsURL
        case hooksURL
        case issueEventsURL
        case eventsURL
        case assigneesURL
        case branchesURL
        case tagsURL
        case blobsURL
        case gitTagsURL
        case gitRefsURL
        case treesURL
        case statusesURL
        case languagesURL
        case stargazersURL
        case contributorsURL
        case subscribersURL
        case subscriptionURL
        case commitsURL
        case gitCommitsURL
        case commentsURL
        case issueCommentURL
        case contentsURL
        case compareURL
        case mergesURL
        case archiveURL
        case downloadsURL
        case issuesURL
        case pullsURL
        case milestonesURL
        case notificationsURL
        case labelsURL
        case releasesURL
        case deploymentsURL
        case createdAt
        case updatedAt
        case pushedAt
        case gitURL
        case sshURL
        case cloneURL
        case svnURL
        case homepage, size
        case stargazersCount
        case watchersCount
        case language
        case hasIssues
        case hasProjects
        case hasDownloads
        case hasWiki
        case hasPages
        case forksCount
        case mirrorURL
        case archived, disabled
        case openIssuesCount
        case license, forks
        case openIssues
        case watchers
        case defaultBranch
        case score
    }
}

enum DefaultBranch: String, Codable {
    case develop = "develop"
    case development = "development"
    case master = "master"
}

enum Language: String, Codable {
    case swift = "Swift"
}

// MARK: - License
struct License: Codable {
    let key: Key?
    let name: Name?
    let spdxID: SpdxID?
    let url: String?
    let nodeID: NodeID?

    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID
        case url
        case nodeID
    }
}

enum Key: String, Codable {
    case cc010 = "cc0-1.0"
    case gpl30 = "gpl-3.0"
    case mit = "mit"
    case mpl20 = "mpl-2.0"
    case other = "other"
}

enum Name: String, Codable {
    case creativeCommonsZeroV10Universal = "Creative Commons Zero v1.0 Universal"
    case gnuGeneralPublicLicenseV30 = "GNU General Public License v3.0"
    case mitLicense = "MIT License"
    case mozillaPublicLicense20 = "Mozilla Public License 2.0"
    case other = "Other"
}

enum NodeID: String, Codable {
    case mDc6TGljZW5ZZTA = "MDc6TGljZW5zZTA="
    case mDc6TGljZW5ZZTE0 = "MDc6TGljZW5zZTE0"
    case mDc6TGljZW5ZZTEz = "MDc6TGljZW5zZTEz"
    case mDc6TGljZW5ZZTY = "MDc6TGljZW5zZTY="
    case mDc6TGljZW5ZZTk = "MDc6TGljZW5zZTk="
}

enum SpdxID: String, Codable {
    case cc010 = "CC0-1.0"
    case gpl30 = "GPL-3.0"
    case mit = "MIT"
    case mpl20 = "MPL-2.0"
    case noassertion = "NOASSERTION"
}

// MARK: - Owner
struct Owner: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: TypeEnum?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID
        case avatarURL
        case gravatarID
        case url
        case htmlURL
        case followersURL
        case followingURL
        case gistsURL
        case starredURL
        case subscriptionsURL
        case organizationsURL
        case reposURL
        case eventsURL
        case receivedEventsURL
        case type
        case siteAdmin
    }
}

enum TypeEnum: String, Codable {
    case organization = "Organization"
    case user = "User"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
