//
//  ExampleAPIService.swift
//  APIBaseProject
//
//  Created by Zhang, Mark on 8/8/2023.
//

import Foundation

class ExampleAPIService {
    // curl https://api.github.com/users/markzhangdev
    static func getGitHubUserInfo(by name: String,
                                  with requestBuilder: NetworkAPIRequestBuilderProtocol = NetworkAPIRequestBuilder(),
                                  and apiClient: NetworkAPIClientProtocol = NetworkAPIClient()) async throws -> GitHubUser
    {
        let gitUserRequest = ExampleRequest(path: "/users/" + name)
        let urlRequest = try await requestBuilder.build(with: gitUserRequest)
        return try await apiClient.fetchData(with: urlRequest)
    }
}
