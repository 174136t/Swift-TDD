//
//  Movie.swift
//  FilmFest-TDD
//
//  Created by Lahiru Neranjan on 2025-06-16.
//

import Foundation

struct Movie: Equatable{
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
}

func==(lhs: Movie, rhs: Movie)-> Bool{
    if(lhs.title != rhs.title) || (lhs.releaseDate != rhs.releaseDate){
        return false
    }
    return true
}
