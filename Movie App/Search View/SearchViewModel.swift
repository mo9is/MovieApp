//
//  SearchViewModel.swift
//  Movie App
//
//  Created by Monis Manzoor on 05/02/25.
//

import Foundation
import UIKit

@Observable
class SearchViewModel : NSObject {
    private let apiManager : APIManager = APIManager()
    var movies : [Movie] = []
    private var searchTask : Task <Void, Error>?
    
    func fetchMovies(ForSearchText searchText : String) {
        self.movies.removeAll()
        searchTask?.cancel()
        self.perform(#selector(searchMovies), with: searchText, afterDelay: 0.5)
    }
    
    @objc func searchMovies(_ searchText : String) {
        searchTask = Task {
            do {
                let movieResponse : MovieResponseModel =  try await apiManager.getData(fromServer: MoviesEndpoint.search(name: searchText))
                self.movies = movieResponse.results
            }
            catch {
                print(error)
            }
        }
    }
}
