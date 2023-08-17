//
//  ProposalViewModel.swift
//  swiftproposals
//
//  Created by Laurent B on 13/08/2023.
//

import Combine
import Foundation

final class ProposalViewModel: ObservableObject {
    @Published var proposals: [ProposalDTO] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        
    }
    
    func fetchInitialData() {
        fetchProposals()
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .assign(to: &$proposals)
    }
}
