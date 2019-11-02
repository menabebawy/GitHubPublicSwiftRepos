//
//  Contributor.swift
//  Entities
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Foundation

public struct Contributor: Codable {
    public let total: Int
    public let weeks: [Week]
    public let author: Owner
}
