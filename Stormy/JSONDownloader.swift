//
//  JSONDownloader.swift
//  Stormy
//
//  Created by Ashwin Iyer on 2017-05-17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


class JSONDownloader {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration){
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init (){
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: AnyObject]
    
    typealias JSONTaskCompletionHandler = (JSON?, DarkSkyError?) -> Void
    
    func JSONTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            
            // Convert to HTTP response
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                        completion(json, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            }
            else {
                completion(nil, .responseUnsucessful)
            }
        }
        
        return task
    }
    
    
    
}
