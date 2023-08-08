//
//  NetworkAPIRequestBuilder.swift
//  APIBaseProject
//
//  Created by Zhang, Mark on 8/8/2023.
//

import Foundation

protocol NetworkAPIRequestBuilderProtocol {
    static func build(with request: RestRequestProtocol) async throws -> URLRequest
}


struct NetworkAPIRequestBuilder: NetworkAPIRequestBuilderProtocol {
    
    static func build(with request: RestRequestProtocol) async throws -> URLRequest {
        guard let url = request.url else {
            throw NetworkAPIClientError.invalidURL
        }
        let urlRequest = URLRequest(url: url)

        //TO-DO: apply result builder here
        let operations: [(URLRequest, RestRequestProtocol) -> URLRequest] = [
            configContentTypeHeader,
            configRequestMethod
        ]
        
        let result = operations.reduce(urlRequest) { result, operation in
            return operation(result, request)
        }
        
        return result
        
    }
    
    static private func configContentTypeHeader(for urlRequest: URLRequest, with request: RestRequestProtocol) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
    
    static private func configRequestMethod(for urlRequest: URLRequest , with request: RestRequestProtocol) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.httpMethod = request.method.rawValue
        return urlRequest
    }
    
    
}
