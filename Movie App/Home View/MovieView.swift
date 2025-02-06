//
//  MovieView.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import SwiftUI
import Kingfisher

extension String {

    var imageURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/original/\(self)")
    }

}

struct MovieView: View {
    let movies : [Movie]
    let title : String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
            MovieScrollView(movies: movies)
        }
    }
}

struct MovieScrollView : View {
    let movies : [Movie]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                ForEach(movies) { movie in
                    NavigationLink(destination:  MovieDetailView(movie: movie, viewModel: MovieDetailViewModel())) {
                        MovieRowView(movie: movie)
                    }
                }
            }
        }.frame(maxWidth : .infinity, maxHeight : 200)
    }
}

struct MovieRowView : View {
    var movie : Movie
    
    var body: some View {
        
        VStack {
            KFImage(movie.backdropPath?.imageURL)
                .resizable()
                .scaledToFill()
                .scaleEffect(1.1)
                .frame(width: 120, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            Text(movie.originalTitle)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(2)
                .frame(width: 130)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

#Preview {
    MovieView(movies: [.dummy], title: "Preview")
        .preferredColorScheme(.dark)
}
