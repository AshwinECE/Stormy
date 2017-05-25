//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Ashwin Iyer on 2017-05-15.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let temperature: Double
    let humidity: Double
    let precipitationProbability: Double
    let string: String
    let icon: String
}


extension CurrentWeather {
    struct Key {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipitationProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
        
    }
    
    init?(json: [String: AnyObject]) {
        guard let tempValue = json[Key.temperature] as? Double,
        let humidityValue = json[Key.humidity] as? Double,
        let precipitationProbabilityValue = json[Key.precipitationProbability] as? Double,
        let summaryString = json[Key.summary] as? String,
        let iconString = json[Key.icon] as? String
        else{
            return nil
        }
        
        self.temperature = tempValue
        self.humidity = humidityValue
        self.precipitationProbability = precipitationProbabilityValue
        self.string = summaryString
        self.icon = iconString
        
    }
}
