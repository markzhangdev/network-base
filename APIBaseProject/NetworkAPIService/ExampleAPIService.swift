//
//  ExampleAPIService.swift
//  APIBaseProject
//
//  Created by Zhang, Ming on 8/8/2023.
//

import Foundation

class ExampleAPIService {
    // curl https://api.github.com/users/markzhangdev
   static func getGitHubUserInfo(by name: String) async throws -> GitHubUser {
        let gitUserRequest = ExampleRequest(path: "/users/" + name)
        let urlRequest = try await NetworkAPIRequestBuilder(request: gitUserRequest).build()
        let networkClient = NetworkAPIClient()
        let userInfo : GitHubUser = try await networkClient.fetchData(with: urlRequest)
        return userInfo
    }
}
