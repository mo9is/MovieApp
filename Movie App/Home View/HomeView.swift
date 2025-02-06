//
//  ContentView.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import SwiftUI

struct HomeView: View {
    @State var homeViewModel : HomeViewModel
    @State var isButtonActive : Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 10) {
                    HeaderView()
                        .padding(.bottom, 30)
                    
                    MovieView(movies: homeViewModel.populars, title: "Populars")
                    
                    MovieView(movies: homeViewModel.topRatedMovies, title: "Top Rated")
                    
                    MovieView(movies: homeViewModel.upcomingMovies, title: "Upcoming")
                    
                    Spacer()
                }.toolbar {
                    Button("", systemImage: "magnifyingglass", action :{
                        self.isButtonActive.toggle()
                    })
                }
            }.padding()
                .navigationDestination(isPresented: $isButtonActive) {
                              SearchView()
                          }
                .task {
                    await homeViewModel.fetchMovies()
                }
        }
        .accentColor(.white)
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
        .preferredColorScheme(.dark)
}
