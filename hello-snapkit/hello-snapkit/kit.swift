//
//  kit.swift
//  hello-snapkit
//
//  Created by hx on 5/7/16.
//  Copyright © 2016 hx. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
