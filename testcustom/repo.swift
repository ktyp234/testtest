//
//  userProfile.swift
//  testcustom
//
//  Created by 김지훈 on 18/01/2019.
//  Copyright © 2019 KimJihun. All rights reserved.
//

import Foundation

typealias Repo = [RepoElement]

struct RepoElement: Codable {
    let id: Int
    let nodeID, name, fullName: String
    let repoPrivate: Bool
    let owner: Owner
    let htmlURL: String
    let description: String?
    let fork: Bool
    let url: String
    let forksURL: String
    let keysURL, collaboratorsURL: String
    let teamsURL, hooksURL: String
    let issueEventsURL: String
    let eventsURL: String
    let assigneesURL, branchesURL: String
    let tagsURL: String
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String
    let statusesURL: String
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String
    let subscriptionURL: String
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String
    let contentsURL, compareURL: String
    let mergesURL: String
    let archiveURL: String
    let downloadsURL: String
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String
    let labelsURL, releasesURL: String
    let deploymentsURL: String
    let createdAt, updatedAt, pushedAt: Date
    let gitURL, sshURL: String
    let cloneURL: String
    let svnURL: String
    let homepage: String?
    let size, stargazersCount, watchersCount: Int
    let language: String?
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    let hasPages: Bool
    let forksCount: Int
    let mirrorURL: JSONNull?
    let archived: Bool
    let openIssuesCount: Int
    let license: License?
    let forks, openIssues, watchers: Int
    let defaultBranch: DefaultBranch
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case repoPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case description, fork, url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived
        case openIssuesCount = "open_issues_count"
        case license, forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
    }
}

enum DefaultBranch: String, Codable {
    case ghPages = "gh-pages"
    case master = "master"
}

struct License: Codable {
    let key: Key
    let name: Name
    let spdxID: SpdxID
    let url: String?
    let nodeID: LicenseNodeID
    
    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}

enum Key: String, Codable {
    case mit = "mit"
    case other = "other"
}

enum Name: String, Codable {
    case mitLicense = "MIT License"
    case other = "Other"
}

enum LicenseNodeID: String, Codable {
    case mDc6TGljZW5ZZTA = "MDc6TGljZW5zZTA="
    case mDc6TGljZW5ZZTEz = "MDc6TGljZW5zZTEz"
}

enum SpdxID: String, Codable {
    case mit = "MIT"
    case noassertion = "NOASSERTION"
}

struct Owner: Codable {
    let login: Login
    let id: Int
    let nodeID: OwnerNodeID
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL: FollowingURL
    let gistsURL: GistsURL
    let starredURL: StarredURL
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: EventsURL
    let receivedEventsURL: String
    let type: TypeEnum
    let siteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

enum EventsURL: String, Codable {
    case httpsAPIGithubCOMUsersMojomboEventsPrivacy = "https://api.github.com/users/mojombo/events{/privacy}"
}

enum FollowingURL: String, Codable {
    case httpsAPIGithubCOMUsersMojomboFollowingOtherUser = "https://api.github.com/users/mojombo/following{/other_user}"
}

enum GistsURL: String, Codable {
    case httpsAPIGithubCOMUsersMojomboGistsGistID = "https://api.github.com/users/mojombo/gists{/gist_id}"
}

enum Login: String, Codable {
    case mojombo = "mojombo"
}

enum OwnerNodeID: String, Codable {
    case mdq6VXNlcjE = "MDQ6VXNlcjE="
}

enum StarredURL: String, Codable {
    case httpsAPIGithubCOMUsersMojomboStarredOwnerRepo = "https://api.github.com/users/mojombo/starred{/owner}{/repo}"
}



// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
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
