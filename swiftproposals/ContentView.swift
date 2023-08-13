//
//  ContentView.swift
//  swiftproposals
//
//  Created by Laurent B on 13/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProposalViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            viewModel.fetchInitialData()
        }
    }
}

#Preview {
    ContentView()
}
