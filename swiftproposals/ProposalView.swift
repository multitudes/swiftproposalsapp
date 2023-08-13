//
//  ContentView.swift
//  swiftproposals
//
//  Created by Laurent B on 13/08/2023.
//

import SwiftUI

struct ProposalView: View {
    @StateObject var viewModel = ProposalViewModel()
    var count: String {
        if viewModel.proposals.count > 0 {
            "\(viewModel.proposals.count) proposals"
        } else {
            "-"
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(count)) {
                    List(viewModel.proposals) { proposal in
                        VStack(alignment: .leading, spacing: -10) {
                        
//                            Image(systemName: "swift")
//                                .padding(5)
//                                .foregroundColor(.red)
                            
                                Text(
"\(Image(systemName: "swift")) \(proposal.id) - \(proposal.title)")
                                    .font(.headline)
                                    .accentColor(.red)
                                    .lineLimit(3)
                            
                            Text(proposal.status.state.dropFirst())
                                .font(.body)
                                
                        }
                        .frame( height: 100)
                    }
                    .refreshable {
                        //await store.loadStats()
                        viewModel.fetchInitialData()
                    }
                }
            }
            .navigationTitle(
                Text("Swift Evolution")
            )
        }
        .onAppear {
            viewModel.fetchInitialData()
        }
    }
}

#Preview {
    ProposalView()
}
