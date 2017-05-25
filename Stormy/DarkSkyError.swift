//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Ashwin Iyer on 2017-05-17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsucessful
    case invalidData
    case jsonConversionFailure
    case invalidURL
    case jsonParsingFailure
}
