//
//  SparkleTests.swift
//  SparkleTests
//
//  Created by Promise Ochornma on 08/07/2024.
//

import XCTest
@testable import Sparkle


final class SparkleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_result_view_model(){
            
        let info = CharacterResponseInfo(count: 826, pages: 42, next: "https://rickandmortyapi.com/api/character/?page=2", prev: "https://rickandmortyapi.com/api/character/?page=2")
        
        let result = CharacterResponseResult(id: 1, name: "Rick Sanchez", status: .alive, species: .human, type: "", gender: .male, origin: .init(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: .init(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1"], url: "https://ricandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z")
        
        let expected = CharacterResponse(info: info, results: [result])
        let data = expected.results ?? []
        let model = data.map({
            return FilmCharacter(data: $0)
        })
        
            
        XCTAssertEqual(data[0].name, model[0].name)
        XCTAssertEqual(data[0].origin?.name, model[0].origin)
        XCTAssertEqual(data[0].location?.name, model[0].location)
        }


}
