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
    var libraryVC: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    let fairyMovie = Movie(title: "Fairy")
    let actionMovie = Movie(title: "Action")
    let comedyMovie = Movie(title: "Comedy")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(datasource: sut)
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID") as? LibraryViewController
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
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
//        sut.movieManager?.addMovie(movie: fairyMovie)
//        sut.movieManager?.addMovie(movie: actionMovie)
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//        
//        sut.movieManager?.addMovie(movie: comedyMovie)
//        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount(){
//        sut.movieManager?.addMovie(movie: fairyMovie)
//        sut.movieManager?.addMovie(movie: actionMovie)
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//        
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell(){
        sut.movieManager?.addMovie(movie: actionMovie)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell(){
        
        sut.movieManager?.addMovie(movie: comedyMovie)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData(){
        
        sut.movieManager?.addMovie(movie: actionMovie)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, actionMovie)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData(){
        
        sut.movieManager?.addMovie(movie: actionMovie)
        sut.movieManager?.addMovie(movie: comedyMovie)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, actionMovie)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie(){
        sut.movieManager?.addMovie(movie: actionMovie)
        sut.movieManager?.addMovie(movie: comedyMovie)
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues(){
        let section1Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies to see")
        XCTAssertEqual(section2Title, "Movies seen")
    }

} 



