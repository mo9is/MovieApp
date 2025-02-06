//
//  MovieDetailView.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import SwiftUI
import Kingfisher

struct MovieDetailView : View {
    let movie : Movie
    @State var viewModel : MovieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ZStack {
                    KFImage(movie.backdropPath?.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Image(systemName: "play.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 50, weight: .medium))
                            Text("Play")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .medium))
                        }
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(movie.title)
                            .font(.system(size: 25, weight: .medium))
                        Text(movie.overview)
                            .font(.system(size: 20))
                    }.padding()
                    
                    VStack(alignment : .leading, spacing : 0) {
                        Text("Cast")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight : .medium))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top) {
                              ForEach(viewModel.casts) { cast in
                                    CastView(cast: cast)
                                      .frame(width : 130)
                              }
                            }
                        }
                    }.padding()
                }.frame(width : geometry.size.width, height: geometry.size.height * 0.6)
            }
        }
        .ignoresSafeArea(.all)
            .task {
               await viewModel.fetchCasts(ForMovieId: movie.id)
            }
    }
}

struct CastView : View {
    let cast : CastModel
    
    var body: some View {
        VStack(alignment: .leading, spacing : 0) {
            KFImage(cast.imageURL?.imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: 130, height : 200)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            
            Text(cast.name)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    MovieDetailView(movie: .dummy, viewModel: MovieDetailViewModel())
        .preferredColorScheme(.dark)
}
