//
//  JSONSerializable.swift
//  APIBaseProject
//
//  Created by Zhang, Mark on 9/8/2023.
//

import Foundation

public protocol JSONSerializable {
    func serializeToJSON() -> Data?
}

extension JSONSerializable where Self: Encodable {
    public func serializeToJSON() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}
