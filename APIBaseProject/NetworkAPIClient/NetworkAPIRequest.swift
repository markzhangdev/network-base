//
//  NetworkAPIRequest.swift
//  APIBaseProject
//
//  Created by Zhang, Mark on 7/8/2023.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}

protocol RestRequestProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var url: URL? { get }
    var query: [String: String]? { get set }
    var body: Encodable? { get set }
}
