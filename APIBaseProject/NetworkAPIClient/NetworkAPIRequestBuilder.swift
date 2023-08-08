//
//  NetworkAPIRequestBuilder.swift
//  APIBaseProject
//
//  Created by Zhang, Mark on 8/8/2023.
//

import Foundation

protocol NetworkAPIRequestBuilderProtocol {
    func build(with request: RestRequestProtocol) async throws -> URLRequest
}

struct NetworkAPIRequestBuilder: NetworkAPIRequestBuilderProtocol {
    typealias URLRequestDecorator = (URLRequest, RestRequestProtocol) -> URLRequest
    
    func build(with request: RestRequestProtocol) async throws -> URLRequest {
        guard let url = request.url else {
            throw NetworkAPIClientError.invalidURL
        }
        let urlRequest = URLRequest(url: url)

        let operations = buildDecoratorArray()
        
        let result = operations.reduce(urlRequest) { result, operation in
            operation(result, request)
        }
        
        return result
    }
    
    private func configContentTypeHeader(for urlRequest: URLRequest, with request: RestRequestProtocol) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
    
    private func configRequestMethod(for urlRequest: URLRequest, with request: RestRequestProtocol) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.httpMethod = request.method.rawValue
        return urlRequest
    }
    
    @URLRequestDecoratorBuilder
    private func buildDecoratorArray() -> [URLRequestDecorator] {
        configContentTypeHeader
        configRequestMethod
    }
    
    @resultBuilder
    enum URLRequestDecoratorBuilder {
        static func buildBlock(_ components: URLRequestDecorator...) -> [URLRequestDecorator] {
            var result: [URLRequestDecorator] = []
            for component in components {
                result.append(component)
            }
            return result
        }
    }
}
