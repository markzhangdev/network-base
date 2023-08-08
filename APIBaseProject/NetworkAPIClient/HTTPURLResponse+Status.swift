//
//  HTTPURLResponse+Status.swift
//  APIBaseProject
//
//  Created by Zhang, Mark on 8/8/2023.
//

import Foundation

public extension HTTPURLResponse {
    var wasSuccessful: Bool {
        let successRange = 200 ..< 300
        return successRange.contains(statusCode)
    }
}
