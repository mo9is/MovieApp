//
//  HomeViewModel.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import SwiftUI
import Foundation

@MainActor @Observable class HomeViewModel {
    
    private let apiManager : APIManager  = APIManager()
    var populars: [Movie] = []
    var topRatedMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    func fetchMovies() async  {
        await withTaskGroup(of: Void.self) { group in
            group.addTask {
                await self.fetchMovieType(.popular)
            }
            group.addTask {
                await self.fetchMovieType(.topRated)
            }
            group.addTask {
                await self.fetchMovieType(.upcoming)
            }
        }
    }
    
    private func fetchMovieType(_ endpointType : MoviesEndpoint) async {
        do {
            let response : MovieResponseModel = try await apiManager.getData(fromServer: endpointType)
            if endpointType == .popular {
                self.populars = response.results
            }
            else if endpointType == .topRated {
                self.topRatedMovies = response.results
            }
            else if endpointType == .upcoming {
                self.upcomingMovies = response.results
            }
        }
        catch {
            print(error)
        }
    }
}
