//
//  ExampleRequest.swift
//  APIBaseProject
//
//  Created by Zhang, Mark on 8/8/2023.
//

import Foundation

struct ExampleRequest: RestRequestProtocol {
    
    private static let baseURL = "https://api.github.com"
 
    let path: String
    
    var method: HTTPMethod
    
    var query: [String : String]?
    
    var body: Encodable?
    
    init(path: String,
         method: HTTPMethod = .get,
         query: [String : String]? = nil,
         body: Encodable? = nil) {
        self.path = path
        self.method = method
        self.query = query
        self.body = body
    }
}

extension ExampleRequest {

    var url: URL? {
        guard let url = URL(string: ExampleRequest.baseURL) else { return nil }
        guard let pathURL = URL(string: path, relativeTo: url) else { return nil }
        return pathURL
    }
}
