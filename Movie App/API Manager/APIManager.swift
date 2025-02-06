//
//  APIManager.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import SwiftUI

enum NetworkError : Error {
    case invalidURL
    case invalidResponse
}

class APIManager {
    
    func getData<T : Decodable>(fromServer type : EndPoint) async throws -> T {
        guard let url = type.url, url.absoluteString.isEmpty == false else {
            throw NetworkError.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = type.method.rawValue
        if let body = type.body {
            urlRequest.httpBody = try? JSONEncoder().encode(body)
        }
        urlRequest.allHTTPHeaderFields = type.header
        let (data, response) = try await URLSession.shared.data(from: url)
        print(response)
        guard response as? HTTPURLResponse != nil else {
            throw NetworkError.invalidResponse
        }
        if (response as! HTTPURLResponse).statusCode == 200 {
           return try JSONDecoder().decode(T.self, from: data)
        }
        throw NetworkError.invalidResponse
    }
    
    static var commonHeaders: [String: String]? {
        ["accept" : "application/json"]
    }
}
