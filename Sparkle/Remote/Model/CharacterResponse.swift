//
//  CharacterResponse.swift
//  Sparkle
//
//  Created by Promise Ochornma on 08/07/2024.
//

import Foundation

// MARK: - CharacterResponse
struct CharacterResponse: Codable, Equatable {
    static func == (lhs: CharacterResponse, rhs: CharacterResponse) -> Bool {
        return lhs.results == rhs.results
    }
    
    let info: CharacterResponseInfo?
    let results: [CharacterResponseResult]?
}

// MARK: - Info
struct CharacterResponseInfo: Codable {
    let count, pages: Int?
    let next, prev: String?
}

// MARK: - Result
struct CharacterResponseResult: Codable, Equatable {
    static func == (lhs: CharacterResponseResult, rhs: CharacterResponseResult) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.status == rhs.status && lhs.species == rhs.species && lhs.type == rhs.type && lhs.gender == rhs.gender && lhs.origin == rhs.origin && lhs.location == rhs.location && lhs.image == rhs.image && lhs.episode == rhs.episode && lhs.url == rhs.url && lhs.created == rhs.created
    }
    
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable, Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
    let name: String?
    let url: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

let characterResponseSample = "{  \"info\": {\"count\": 826,\"pages\": 42,\"next\": \"https://rickandmortyapi.com/api/character/?page=2\",\"prev\": \"https://rickandmortyapi.com/api/character/?page=2\"  },  \"results\": [{  \"id\": 1,  \"name\": \"Rick Sanchez\",  \"status\": \"Alive\",  \"species\": \"Human\",  \"type\": \"\",  \"gender\": \"Male\",  \"origin\": {\"name\": \"Earth\",\"url\": \"https://rickandmortyapi.com/api/location/1\"  },  \"location\": {\"name\": \"Earth\",\"url\": \"https://rickandmortyapi.com/api/location/20\"  },  \"image\": \"https://rickandmortyapi.com/api/character/avatar/1.jpeg\",  \"episode\": [\"https://rickandmortyapi.com/api/episode/1\"  ],  \"url\": \"https://ricandmortyapi.com/api/character/1\",  \"created\": \"2017-11-04T18:48:46.250Z\"}  ]}".data(using: .utf8)
