//
//  Coordinate.swift
//  Stormy
//
//  Created by Ashwin Iyer on 2017-05-20.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
}
