//
//  APIManager.swift
//  MusicVideo
//
//  Created by Kevin on 6/10/16.
//  Copyright © 2016 Michael Rudowsky and student(s). All rights reserved.
//

import Foundation

class APIManager {
    
    private var videos: [MusicVideo] = [MusicVideo]()
    
    func loadData(urlString: String, completion: (result: [MusicVideo]) -> () ) {
        // preclude session caching
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> () in
            
            guard error == nil else {
                print("error:  \(error!.localizedDescription)")
                return
            }
            
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data!,
                        options: .AllowFragments) as? JSONDictionary {
                    // print(json)
                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                    dispatch_async(dispatch_get_global_queue(priority, 0)) {
                        dispatch_async(dispatch_get_main_queue()) {
                            print("JSONSerialization successful")
                            completion(result: self.videos)
                        }
                    }
                }
            } catch {
                dispatch_async(dispatch_get_main_queue()) {
                    // completion(result: "error in JSONSerialization")
                    print("error in JSONSerialization")
                }
            }
        }
        task.resume()
    }
}