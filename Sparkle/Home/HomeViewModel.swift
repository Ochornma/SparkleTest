//
//  HomeViewModel.swift
//  Sparkle
//
//  Created by Promise Ochornma on 09/07/2024.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    var cancelable = Set<AnyCancellable>()
    @Published var isLoading : Bool = false
    @Published var pagination : Int = 0
    @Published var filmCharacter : [FilmCharacter] = []
    var networkManager: NetworkManager
    
    init() {
        self.networkManager = NetworkManagerImpl.shared
    }
    
    func requestForCharacter(page: Int){
        isLoading = true
        pagination = page
        networkManager.getCharacters(pageNumber: "\(page)")
            .sink(receiveCompletion: {[weak self] result in
                self?.isLoading = false
            }, receiveValue: { [weak self] values in
                let data = values.results ?? []
                self?.filmCharacter =  data.map({
                    return FilmCharacter(data: $0)
                })
            }).store(in: &cancelable)
    }
}
