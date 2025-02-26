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
