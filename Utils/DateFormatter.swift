//
//  DateFormatter.swift
//  Utils
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Bitpanda Test. All rights reserved.
//

import Foundation

public final class DateFormatterBuilder {
    private let timeStamp: Double
    private var dateString: String = ""

    public init(timeStamp: Double) {
        self.timeStamp = timeStamp
    }

    /// Use  it on formatting week info for contributor commits 
    public func medium() -> DateFormatterBuilder {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        dateString = dateFormatter.string(from: date)
        return self
    }

    public func build() -> String {
        return dateString
    }

}
