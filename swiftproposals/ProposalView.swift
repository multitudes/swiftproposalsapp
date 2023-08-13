//
//  ContentView.swift
//  swiftproposals
//
//  Created by Laurent B on 13/08/2023.
//

import SwiftUI

struct ProposalView: View {
    @StateObject var viewModel = ProposalViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("\(viewModel.proposals.count)")) {
                    List(viewModel.proposals) { proposal in
                        VStack(alignment: .leading) {
                        
//                            Image(systemName: "swift")
//                                .padding(5)
//                                .foregroundColor(.red)
                            
                                Text(
"\(Image(systemName: "swift")) \(proposal.id) - \(proposal.title)")
                                    .font(.headline)
                                    .accentColor(.red)
                            
                            Text(proposal.status.state  + proposal.title)
                                .font(.caption)
                                .lineLimit(3)
                        }
                        
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
