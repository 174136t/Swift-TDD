//
//  MockExtentions.swift
//  FilmFest-TDDTests
//
//  Created by Lahiru Neranjan on 2025-06-20.
//

import Foundation
import UIKit

@testable import FilmFest_TDD

extension MovieLibraryDataServiceTests{
    
    class TableViewMock:UITableView{
        var cellDequeuedProperly = false
        
        class func initMock(datasource: MovieLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = datasource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell{
        var movieData:Movie?
        
        override func configMovieCell(movie: Movie) {
            movieData = movie
        }
    }
}

extension MovieCellTests{
    
    class MockCellDataSource:NSObject,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
    
    }
}
