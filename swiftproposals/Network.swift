//
//  Network.swift
//  swiftproposals
//
//  Created by Laurent B on 13/08/2023.
//

import Combine
import Foundation

enum NetworkingError: Error {
    case invalidURL
}

func fetchProposals() -> some Publisher<[Proposal], Error> {
    
    guard let url = Proposal.dataURL else {
        return Fail(error: NetworkingError.invalidURL)
            .eraseToAnyPublisher()
    }
    
    return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: [Proposal].self, decoder: JSONDecoder())
        .print("data")
        .eraseToAnyPublisher()
}
