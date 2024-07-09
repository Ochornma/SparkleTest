//
//  Character.swift
//  Sparkle
//
//  Created by Promise Ochornma on 09/07/2024.
//

import Foundation
import SparkleDateFormatter

struct FilmCharacter: Identifiable{
    let id =  UUID()
    let avatar: String
    let name: String
    let type: String
    let gender: String
    let species: String
    let location: String
    let origin: String
    let episodes: String
    let date: String
    
    init(data: CharacterResponseResult) {
        self.avatar = data.image ?? ""
        self.name = data.name ?? ""
        self.type = data.type ?? ""
        self.gender = data.gender?.rawValue ?? ""
        self.species = data.species?.rawValue ?? ""
        self.location = data.location?.name ?? ""
        self.origin = data.origin?.name ?? ""
        self.episodes = "\(data.episode?.count ?? 0) \((data.episode?.count ?? 0) > 1 ? "Episodes" : "Episode")"
        self.date = SparkleDateFormatter().dateFromString(data.created ?? "", dateFormat: .dd_MMMM_yyyy)
    }
}
