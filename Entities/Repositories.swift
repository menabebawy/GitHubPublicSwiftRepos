//
//  Repositories.swift
//  Bitpanda Task
//
//  Created by Mena Yousif on 10/30/19.
//  Copyright © 2019 Bitpanda Task. All rights reserved.
//

import Foundation

public struct Repositories: Codable {
    public let totalCount: Int
    public let items: [Repository]

    public enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items = "items"
    }
}
