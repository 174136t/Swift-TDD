//
//  MovieStructTests.swift
//  FilmFest-TDDTests
//
//  Created by Lahiru Neranjan on 2025-06-16.
//

import XCTest
@testable import FilmFest_TDD

final class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initialization
    func testInit_MovieWithTitle(){
        let testMovie = Movie(title:"Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate(){
        let testMovie = Movie(title: "Romantic Comedy", releaseDate: "1987")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }
    
    // MARK: Equatable
    func testEquatable_ReturnsTrue(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEuatable_ReturnsNotEqualForDifferentReleaseDates(){
        let actionMovie1 = Movie(title: "Action", releaseDate: "1987")
        let actionMovie2 = Movie(title: "Action", releaseDate: "1988")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }

}
