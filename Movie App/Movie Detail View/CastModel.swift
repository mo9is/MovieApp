//
//  CastModel.swift
//  Movie App
//
//  Created by Monis Manzoor on 05/02/25.
//

import Foundation

struct CastResponseModel: Decodable {
    let cast: [CastModel]
}

struct CastModel: Decodable, Identifiable {
    var id = UUID()
    let name, character: String
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case name, character
        case imageURL = "profile_path"
    }
}
