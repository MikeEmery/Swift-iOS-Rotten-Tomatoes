//
//  MovieList.swift
//  SwiftTomatoes
//
//  Created by Michael Emery on 6/11/14.
//  Copyright (c) 2014 Michael Emery. All rights reserved.
//

import UIKit

class MovieList: NSObject {
    var movies = Movie[]()
    
    init() {
        
    }
    
    init(jsonData: NSData) {
        var data: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as NSDictionary
        
        let movieArray: NSArray = data["movies"] as NSArray
        for movieDataContainer: AnyObject in movieArray {
            if let movieData = movieDataContainer as? NSDictionary {
                println(movieData)
                let movieObj = Movie(rawData: movieData)
                movies.append(movieObj)
            }
        }
    }
    
    func get(index: Int) -> Movie {
        return movies[index]
    }
    
    func size() -> Int {
        return movies.count
    }
}
