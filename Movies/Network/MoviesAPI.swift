//
//  MoviesAPI.swift
//  Movies
//
//  Created by onton on 23.11.2022.
//

import Alamofire

enum MoviesAPI {
    case moviesList(Int)
    case movieDetail(Int)

    private var key: String {
        "c9856d0cb57c3f14bf75bdc6c063b8f3"
    }
}

extension MoviesAPI: RequestProtocol {
    var baseURL: URL {
        URL(string: "https://api.themoviedb.org/3")!
    }

    var path: String {
        switch self {
        case .moviesList:
            return "/discover/movie"
        case .movieDetail(let movieID):
            return "/movie/\(movieID)"
        }
    }

    var parameters: Parameters? {
        var parameters = [ParametersKeys.apiKey.rawValue: key]
        switch self {
        case .moviesList(let page):
            parameters[ParametersKeys.page.rawValue] = String(page)
        case .movieDetail:
            break
        }
        return parameters
    }
}

private extension MoviesAPI {
    enum ParametersKeys: String {
        case apiKey = "api_key"
        case page
    }
}
