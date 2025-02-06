//
//  SearchVuew.swift
//  Movie App
//
//  Created by Monis Manzoor on 05/02/25.
//

import SwiftUI

struct SearchView : View {
    @State var viewModel = SearchViewModel()
    @State var searchText : String = ""
    private let columns : [GridItem] = [
        GridItem(.flexible(), spacing : 8),
        GridItem(.flexible(), spacing : 8),
        GridItem(.flexible(), spacing : 8),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie, viewModel: MovieDetailViewModel())) {
                            MovieRowView(movie: movie)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Enter text to search")
        .onChange(of: searchText) { (oldValue, newValue) in
            guard !newValue.isEmpty else {
                viewModel.movies.removeAll()
                return
            }
            if oldValue != newValue {
                viewModel.fetchMovies(ForSearchText: newValue)
            }
        }
        .accentColor(.white)
    }
}


#Preview {
    SearchView()
        .preferredColorScheme(.dark)
}
