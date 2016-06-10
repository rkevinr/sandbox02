//
//  APIManager.swift
//  MusicVideo
//
//  Created by Kevin on 6/10/16.
//  Copyright © 2016 Michael Rudowsky. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString: String, completion: (result: String) -> () ) {
        
        // preclude session caching
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> () in
            
            dispatch_async(dispatch_get_main_queue()) {
                if error != nil {
                    completion(result: (error!.localizedDescription))
                } else {
                    completion(result: "NSURLSession successful")
                    print(data!)
                }
            }
        }
        
        task.resume()
    }
}