//
//  NetworkManager.swift
//  Sparkle
//
//  Created by Promise Ochornma on 08/07/2024.
//

import Foundation
import Moya
import Combine
import CombineMoya

protocol NetworkManager{
    
    func getCharacters(pageNumber: String?) -> AnyPublisher<CharacterResponse, ApiError>
}

class NetworkManagerImpl: NetworkManager {
    
    
    var cancelable = Set<AnyCancellable>()
    private let provider: MoyaProvider<MultiTarget>
    
    init(provider: MoyaProvider<MultiTarget> = MoyaProvider<MultiTarget>()){
        self.provider = provider
    }
    static let shared = NetworkManagerImpl()
    
    func getCharacters(pageNumber: String?) -> AnyPublisher<CharacterResponse, ApiError> {
        return request(APIService.getCharacters(["page": pageNumber]))
    }
    
    
    
    private  func request<T: Codable>(_ target: APIService) -> AnyPublisher<T, ApiError> {
        Future<T, ApiError> {[weak self] promise in
            guard let self else {
                promise(.failure(.errorMessage(message: "Unknown error")))
                return
            }
            self.provider.requestPublisher(MultiTarget(target))
                        .sink(receiveCompletion: { completion in
                            switch completion{
                            case .finished :
                                print("RECEIVE VALUE COMPLETED")
                            case .failure (let err):
                                promise(.failure(.errorMessage(message: err.localizedDescription)))
                            }
                        }, receiveValue: { response in
                            do {
                                let result = try JSONDecoder().decode(T.self, from: response.data)
                                promise(.success(result))
                            } catch let err {
                                promise(.failure(.errorMessage(message: err.localizedDescription)))
                            }
                          
                        })
                        .store(in: &self.cancelable)

                }.eraseToAnyPublisher()
       
    }
    
    
}


enum ApiError: Error {
    case errorMessage(message: String)
}
