//
//  MovieManagerTests.swift
//  FilmFest-TDDTests
//
//  Created by Lahiru Neranjan on 2025-06-16.
//

import XCTest
@testable import FilmFest_TDD

final class MovieManagerTests: XCTestCase {
    //sut = system under test
    var sut:MovieManager!
    
    let actionMovie = Movie(title: "Action")
    let thrillerMovie = Movie(title: "Thriller")
    let comedyMovie = Movie(title: "Comedy")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero(){
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero(){
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne(){
        sut.addMovie(movie: actionMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex(){
        sut.addMovie(movie: thrillerMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(thrillerMovie.title, movieQueried.title)
    }
    
    // MARK: Checking off
    func testCheckOffMovie_UpdatesMovieManagerCounts(){
        sut.addMovie(movie: comedyMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray(){
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: thrillerMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, thrillerMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex(){
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(actionMovie.title, movieQueried.title)
    }
    
    // MARK: Clearing & Resetting
    func testClearArrays_ReturnsArrayCountsOfZero(){
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: thrillerMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray(){
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: actionMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
}
