//
//  MovieCellTests.swift
//  FilmFest-TDDTests
//
//  Created by Lahiru Neranjan on 2025-06-21.
//

import XCTest
@testable import FilmFest_TDD

final class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetLabelsToMovieData(){
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Action Movie", releaseDate: "2025"))
        
        XCTAssertEqual(cell.textLabel?.text, "Action Movie")
        XCTAssertEqual(cell.detailTextLabel?.text, "2025")
    }
    
    

}
