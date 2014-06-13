//
//  Movie.swift
//  SwiftTomatoes
//
//  Created by Michael Emery on 6/11/14.
//  Copyright (c) 2014 Michael Emery. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var title: String = ""
    var synopsis: String = ""
    var thumbnailUrl: NSURL
    var largeUrl: NSURL
    
    init(rawData: NSDictionary) {
        self.title = rawData["title"] as String
        self.synopsis = rawData["synopsis"] as String
        
        let images: NSDictionary = rawData["posters"] as NSDictionary
        self.thumbnailUrl = NSURL.URLWithString(images["thumbnail"] as String)
        self.largeUrl = NSURL.URLWithString(images["original"] as String)
    }
}
