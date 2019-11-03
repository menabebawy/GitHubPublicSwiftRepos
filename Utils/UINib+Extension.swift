//
//  UINib+Extension.swift
//  Utils
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import UIKit

public extension UIView {

    static func nib() -> UINib {
        return UINib(nibName: "\(self)", bundle: Bundle(for: self))
    }

}
