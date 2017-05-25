//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Ashwin Iyer on 2017-05-20.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let apiKey = "dc9b0c0e53d2fd0692632bc3ba97742a"
    
    lazy var baseURL: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
    }()
    
    let downloader = JSONDownloader()
    
    
    typealias currentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping
         currentWeatherCompletionHandler ) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseURL) else {
            completion(nil, .invalidURL)
            return
        }
        let request = URLRequest(url: url)
        
        let task = downloader.JSONTask(with: request) { json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject],
                    let currentWeather = CurrentWeather(json: currentWeatherJson)
                    else {
                        completion(nil, .jsonParsingFailure)
                        return
                }
                
                completion(currentWeather, nil)

            }
            
        }
            
            task.resume()
        
    }
}
