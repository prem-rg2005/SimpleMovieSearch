//
//  MovieListView.swift
//  SimpleMovieSearch
//
//  Created by Prem Shankar Rajagopalan Nayar on 26/2/25.
//

import SwiftUI

struct MovieListView: View {
    @State private var searchQuery = ""
    @ObservedObject private var viewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $searchQuery, onSearch: searchMovies)
                
                if viewModel.isLoading && viewModel.movies.isEmpty {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxHeight: .infinity)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .frame(maxHeight: .infinity)
                } else {
                    ForEach(viewModel.movies) { movie in
                        MovieListCell(movie: movie)
                            .listRowSeparator(.hidden)
                    }
                    
                    if viewModel.shouldLoadMoreMovies() {
                        HStack {
                            Spacer()
                            Text("Loading more movies.....")
                                .padding()
                            Spacer()
                        }
                        .onAppear {
                            viewModel.fetchMovies()
                        }
                    }
                }
            }
            .navigationTitle("Movie List")
        }
        
    }
    
    private func searchMovies() {
        viewModel.searchMovies(query: searchQuery)
    }

}

#Preview {
    MovieListView()
}
