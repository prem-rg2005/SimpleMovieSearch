//
//  MovieListCell.swift
//  SimpleMovieSearch
//
//  Created by Prem Shankar Rajagopalan Nayar on 26/2/25.
//

import SwiftUI

struct MovieListCell: View {
    @State var movie: Movie = .init(title: "Harry Potter Part 7 and just a very long title", year: "2011", id: "tt1201607", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BOTA1Mzc2N2ItZWRiNS00MjQzLTlmZDQtMjU0NmY1YWRkMGQ4XkEyXkFqcGc@._V1_SX300.jpg")

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.poster)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("No image available")
                } else {
                    Image.sysImage.placeholderImg
                }
            }
            .frame(width: 100)
            .cornerRadius(10)
            
            VStackLayout(alignment: .leading) {
                HStack {
                    Text(movie.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                    Spacer()
                }
                Text("Year: \(movie.year)")
                    .font(.subheadline)
                    .foregroundColor(Color.themeColor.primaryText)
            }
            .padding(.leading, 8)
        }
        .padding()
        .background(Color.themeColor.cellBg)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#Preview {
    MovieListCell()
}
