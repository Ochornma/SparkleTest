//
//  APIService.swift
//  Sparkle
//
//  Created by Promise Ochornma on 08/07/2024.
//

import Foundation
import Moya

enum APIService{
    case getCharacters([String: Any?])
}

extension APIService: TargetType{
    var baseURL: URL {
        return URL(string: "https://rickandmortyapi.com/api")!
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/character"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCharacters(let dictionary):
            return .requestParameters(parameters: removeNullValues(param: dictionary), encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json",
                "Accept": "application/json",]
    }
    
    var sampleData: Data{
        switch self {
        case .getCharacters:
            return characterResponseSample!
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
      }
    
    func removeNullValues(param: [String: Any?]) -> [String: Any]{
        return param.compactMapValues { $0 }
    }
    
}
