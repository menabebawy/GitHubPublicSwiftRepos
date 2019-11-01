//
//  Repository.swift
//  Bitpanda Task
//
//  Created by Mena Yousif on 10/29/19.
//  Copyright © 2019 Bitpanda Task. All rights reserved.
//

import Foundation

public struct Repository: Codable {
    public let id: Int
    public let name: String
    public let full_name: String
    public let size: Int
    public let forks_count: Int
    public let stargazers_url: String
    public let contributors_url: String
}
