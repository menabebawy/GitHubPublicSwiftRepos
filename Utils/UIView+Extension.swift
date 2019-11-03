//
//  UIView+Extension.swift
//  Utils
//
//  Created by Mena Yousif on 11/2/19.
//  Copyright © 2019 Mena Soft. All rights reserved.
//

import UIKit

public extension UIView {

    func makeCircle() {
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }

}
