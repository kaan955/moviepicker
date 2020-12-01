//
//  PickClass.swift
//  moviepicker
//
//  Created by Kaan Baysal on 22.11.2020.
//

import Foundation


class PickClass {
    var startMovieYear:Int?
    var endMovieYear:Int?
    var movieTuru:String?
    var izleyiciKitlesi:String?
    var scoreMovie: String?
    
    init() {
    }
    init(startMovieYear:Int,endMovieYear:Int,movieTuru:String,izleyiciKitlesi:String,scoreMovie:String)
    {
        self.startMovieYear = startMovieYear
        self.endMovieYear = endMovieYear
        self.movieTuru = movieTuru
        self.izleyiciKitlesi = izleyiciKitlesi
        self.scoreMovie = scoreMovie
        
    }
    
    
    
    
    
    
}
