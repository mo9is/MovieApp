//
//  Endpoint.swift
//  Movie App
//
//  Created by Monis Manzoor on 03/02/25.
//

import Foundation

enum HTTPMethod : String {
    case GET
    case POST
    case DELETE
    case PUT
}

protocol EndPoint {
    var url : URL? { get }
    var path : String { get }
    var baseURL : String { get }
    var body : Encodable? { get }
    var header : [String : String]? { get }
    var method : HTTPMethod { get }
}
