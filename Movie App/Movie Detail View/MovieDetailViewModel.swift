//
//  MovieDetailDataModel.swift
//  Movie App
//
//  Created by Monis Manzoor on 05/02/25.
//

import SwiftUI

@Observable
class MovieDetailViewModel {
    let apiManager : APIManager = APIManager()
    var casts : [CastModel] = []
    
    func fetchCasts(ForMovieId movieId : Int) async {
        do {
            let response : CastResponseModel = try await apiManager.getData(fromServer: MoviesEndpoint.credits(movieID: movieId))
            self.casts = response.cast
        }
        catch {
            print(error)
        }
    }
}


