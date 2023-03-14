//
//  Movie.swift
//  Flixster
//
//  Created by Gabe Jones on 3/2/23.
//

import Foundation

//users can view the title, full description, backdrop image, vote average, vote count, popularity

struct MovieResponse: Decodable {
    let results : [Movie]
}

struct Movie: Decodable {
    let original_title: String
    let poster_path: URL
    let backdrop_path: URL
    let overview: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
}
