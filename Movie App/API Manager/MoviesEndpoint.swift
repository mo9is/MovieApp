//
//  MoviesEndpoint.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import SwiftUI

enum MoviesEndpoint : Equatable {
    case popular
    case topRated
    case upcoming
    case credits(movieID: Int)
    case search(name: String)
}

extension MoviesEndpoint: EndPoint {

#warning("Enter your API key here")
    private var apiKey: String {
        return ""
    }
    
    var url: URL? {
        switch self {
        case .search:
           return URL(string: baseURL + path + "&api_key=\(apiKey)")
        default:
            return URL(string: baseURL + path + "?api_key=\(apiKey)")
        }
    }
    
    var baseURL: String {
        switch self {
        case .search:
            return "https://api.themoviedb.org/3/search/movie?"
        default:
            return "https://api.themoviedb.org/3/movie/"
        }
    }
    
    var body: (any Encodable)? {
        return nil
    }
    
    var header: [String : String]? {
        return APIManager.commonHeaders
    }
    
    var method: HTTPMethod {
        return HTTPMethod.GET
    }
    
    var path: String {
        switch self {
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        case .credits(let id):
            return "\(id)" + "/credits"
        case .search(let name):
            return "query=\(name)"
        }
    }
}
