//
//  Contributor.swift
//  Bitpanda Task
//
//  Created by Mena Yousif on 10/30/19.
//  Copyright © 2019 Bitpanda Task. All rights reserved.
//

import Foundation

public struct Owner: Codable {
    public let login: String
    public let avatarUrl: String

    public enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarUrl = "avatar_url"
    }

}
