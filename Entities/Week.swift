//
//  Week.swift
//  Entities
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import Foundation

public struct Week: Codable {
    public let startOfWeek: Double
    public let numberOfAdditions: Int
    public let numberOfDeletions: Int
    public let numberOfCommits: Int

    public enum CodingKeys: String, CodingKey {
        case startOfWeek = "w"
        case numberOfAdditions = "a"
        case numberOfDeletions = "d"
        case numberOfCommits = "c"
    }

}
