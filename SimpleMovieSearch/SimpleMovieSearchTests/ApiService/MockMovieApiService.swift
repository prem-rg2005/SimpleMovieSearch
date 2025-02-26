//
//  MockMovieApiService.swift
//  SimpleMovieSearchTests
//
//  Created by Prem Shankar Rajagopalan Nayar on 27/2/25.
//

import Foundation
import Combine

@testable import SimpleMovieSearch

class MockMovieApiService: MovieApiService {
    var shouldReturnError = false
    var mockMovies: [Movie] = []
    var mockTotalResults = "100"
    var mockResponse = "True"
    var mockError = "Too many"
    
    override func fetchMoviesList(query: String, page: Int) -> AnyPublisher<MovieResponse, Error> {
        if shouldReturnError {
            return Fail(error: NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Network error"]))
                .eraseToAnyPublisher()
        } else {
            let response = MovieResponse(search: mockMovies, totalResults: mockTotalResults, response: mockResponse, error: mockError )
            return Just(response)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
