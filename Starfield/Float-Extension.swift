//
//  Mathy.swift
//  Starfield
//
//  Created by Daniel Mathews on 2015-10-24.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

import Foundation

public extension Float {
    /// SwiftRandom extension
    public static func random(lower: Float = 0, upper: Float = 100) -> Float {
        return (Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
    }
}