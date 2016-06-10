//
//  ViewController.swift
//  MusicVideo
//
//  Created by Michael Rudowsky on 9/10/15.
//  Copyright © 2015 Michael Rudowsky. All rights reserved.
//  

import UIKit

class ViewController: UIViewController {
    
    // MARK:  Helper functions & callbacks
    
    
    // MARK: View Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let api = APIManager()
        api.loadData(
            "https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json") {
                loadingStatus in
                print(loadingStatus)
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

