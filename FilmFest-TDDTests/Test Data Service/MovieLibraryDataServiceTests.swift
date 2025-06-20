//
//  MovieLibraryDataServiceTests.swift
//  FilmFest-TDDTests
//
//  Created by Lahiru Neranjan on 2025-06-20.
//

import XCTest
@testable import FilmFest_TDD

final class MovieLibraryDataServiceTests: XCTestCase {

    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    
    let fairyMovie = Movie(title: "Fairy")
    let actionMovie = Movie(title: "Action")
    let comedyMovie = Movie(title: "Comedy")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        libraryTableView = UITableView()
        libraryTableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Sections
    func testTableViewSections_Count_ReturnsTwo(){
        let dataservice = MovieLibraryDataService()
        let tableView = UITableView()
        tableView.dataSource = dataservice
        
        XCTAssertEqual(tableView.numberOfSections, 2)
        
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount(){
        sut.movieManager?.addMovie(movie: fairyMovie)
        sut.movieManager?.addMovie(movie: actionMovie)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: comedyMovie)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount(){
        sut.movieManager?.addMovie(movie: fairyMovie)
        sut.movieManager?.addMovie(movie: actionMovie)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell(){
        sut.movieManager?.addMovie(movie: actionMovie)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }

}

extension MovieLibraryDataServiceTests{
    
    class TableViewMock:UITableView{
        var cellDequeuedProperly = false
    }
}

