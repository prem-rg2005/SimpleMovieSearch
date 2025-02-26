//
//  SearchBarView.swift
//  SimpleMovieSearch
//
//  Created by Prem Shankar Rajagopalan Nayar on 26/2/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        TextField("Search for movie name...", text: $searchText)
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
