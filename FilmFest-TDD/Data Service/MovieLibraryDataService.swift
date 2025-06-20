//
//  MovieLibraryDataService.swift
//  FilmFest-TDD
//
//  Created by Lahiru Neranjan on 2025-06-20.
//

import UIKit

enum LibrarySection: Int{
    case MoviesToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManager = movieManager else{
            return 0
        }
        
        guard let librarySection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        
        switch librarySection{
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MovieCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
