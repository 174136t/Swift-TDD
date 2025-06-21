//
//  ViewController.swift
//  FilmFest-TDD
//
//  Created by Lahiru Neranjan on 2025-06-15.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "2020"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Comedy", releaseDate: "2022"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Dark", releaseDate: "2025"))
        dataService.movieManager?.addMovie(movie: Movie(title: "thriller", releaseDate: "2010"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Romance", releaseDate: "2000"))
        
        libraryTableView.reloadData()
    }


}

