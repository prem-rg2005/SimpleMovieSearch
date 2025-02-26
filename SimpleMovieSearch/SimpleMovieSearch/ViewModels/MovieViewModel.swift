//
//  MovieViewModel.swift
//  SimpleMovieSearch
//
//  Created by Prem Shankar Rajagopalan Nayar on 26/2/25.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    
    private var movieService = MovieApiService()
    private var cancellables = Set<AnyCancellable>()
    private var searchQuery = ""
    private var totalResults = 0 // Total no. of search results that can be displayed based on query
    private var currentPage = 1  // For pagination
    private var isPaginating = false
    
    var errorMessage: String? = nil
    
    func searchMovies(query: String) {
        // Reset pagination when search query changes
        if query != searchQuery {
            self.searchQuery = query
            self.movies = [] // Clear previous results
            self.currentPage = 1
            self.totalResults = 0
            self.isPaginating = false
        }
        
        // Clear previous results if query is empty
        guard !query.isEmpty else {
            self.movies = []
            return
        }
        
        fetchMovies()
    }
    
    func fetchMovies() {
        guard !isPaginating else {
            // Not scrolling so no need to fetch movies
            return
        }
        
        debugPrint("Fetching movies from API")
        
        isPaginating = true
        isLoading = true
        
        movieService.fetchMoviesList(query: searchQuery, page: currentPage)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case .failure(let failure) = completion {
                    self.errorMessage = failure.localizedDescription
                    debugPrint("Error fetching movies: \(failure.localizedDescription)")
                }
                self.isPaginating = false
            }, receiveValue: { movieResponse in
                if let results = movieResponse.search {
                    debugPrint("Movies fetched successfully!")
                    self.movies.append(contentsOf: results)
                    self.totalResults = Int(movieResponse.totalResults ?? "") ?? 0
                    self.currentPage += 1
                }
            })
            .store(in: &cancellables)
        
    }
    
    // Load more movies while paginating
    func shouldLoadMoreMovies() -> Bool {
        return movies.count < totalResults
    }

}
