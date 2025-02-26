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
        HStack {
            Image.sysImage.searchImage
                .foregroundColor(.blue)
            TextField("Search for movie name...", text: $searchText)
                .foregroundColor(Color.themeColor.primaryText)
                
        }
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
