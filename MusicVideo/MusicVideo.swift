//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Kevin on 6/10/16.
//  Copyright © 2016 Michael Rudowsky & Student(s). All rights reserved.
//

import Foundation

class MusicVideo {
    
    private var _vName: String
    private var _vImageUrl: String
    private var _vVideoUrl: String
    
    
    // MARK: getters
    
    var vName: String { return _vName }
    var vImageUrl: String { return _vImageUrl }
    var vVideoUrl: String { return _vVideoUrl }
    
    
    // MARK: lifecycle methods
    
    // NOTE: relies on being passed the "entry" subtree of orig. iTunes tree
    init(data: JSONDictionary) {
        if let name = data["im:name"] as? JSONDictionary,
                vname = name["label"] as? String {
            _vName = vname
        } else {
            _vName = ""
        }
        
        print("video name:  \(_vName)")
        
        if let image = data["im:image"] as? JSONArray,
                url = image[0] as? JSONDictionary,
                vImageUrl = url["label"] as? String {
            _vImageUrl = vImageUrl
        } else {
            _vImageUrl = ""
        }
      
        // _vImageUrl = ""
        
        
        
        _vVideoUrl = ""
    }
}