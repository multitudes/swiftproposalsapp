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

func fetchProposals() -> some Publisher<[ProposalDTO], Error> {
    
    guard let url = ProposalDTO.dataURL else {
        return Fail(error: NetworkingError.invalidURL)
            .eraseToAnyPublisher()
    }
    
    return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: [ProposalDTO].self, decoder: JSONDecoder())
        .print("data")
        .eraseToAnyPublisher()
}
