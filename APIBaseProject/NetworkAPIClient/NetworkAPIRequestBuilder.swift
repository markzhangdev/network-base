//
//  NetworkAPIRequestBuilder.swift
//  APIBaseProject
//
//  Created by Zhang, Ming on 8/8/2023.
//

import Foundation

protocol NetworkAPIRequestBuilderProtocol {
    func build() async throws -> URLRequest
}


struct NetworkAPIRequestBuilder: NetworkAPIRequestBuilderProtocol {
    
    let request: RestRequestProtocol
    public init(request: RestRequestProtocol) {
        self.request = request
    }
    
    func build() async throws -> URLRequest {
        guard let url = request.url else {
            throw NetworkAPIClientError.invalidURL
        }
        let urlRequest = URLRequest(url: url)

        //TO-DO: apply result builder here
        let operations: [(URLRequest) -> URLRequest] = [
            configContentTypeHeader,
            configRequestMethod
        ]
        
        let result = operations.reduce(urlRequest) { result, operation in
            return operation(result)
        }
        
        return result
        
    }
    
    private func configContentTypeHeader(for urlRequest: URLRequest) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
    
    private func configRequestMethod(for urlRequest: URLRequest) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.httpMethod = request.method.rawValue
        return urlRequest
    }
    
    
}
