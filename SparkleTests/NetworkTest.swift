//
//  NetworkTest.swift
//  SparkleTests
//
//  Created by Promise Ochornma on 09/07/2024.
//
import Foundation
import XCTest
import Combine
import CombineMoya
import Moya
@testable import Sparkle

final class NetworkTest: XCTestCase {

    var networkManager: NetworkManager!
    var cancelable = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        networkManager = NetworkManagerImpl(provider: MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub))

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetUser() {
        let info = CharacterResponseInfo(count: 826, pages: 42, next: "https://rickandmortyapi.com/api/character/?page=2", prev: "https://rickandmortyapi.com/api/character/?page=2")
        
        let result = CharacterResponseResult(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "", gender: .male, origin: .init(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: .init(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1"], url: "https://ricandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
        
        let expected = CharacterResponse(info: info, results: [result])
        var response: CharacterResponse?
        
        networkManager.getCharacters(pageNumber: "1")
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    print("finished")
                case .failure(let failure):
                    response = nil
                }
            }, receiveValue: { values in
                response = values
            })
            .store(in: &cancelable)
       
            XCTAssert(response == expected)
        }

 


}
