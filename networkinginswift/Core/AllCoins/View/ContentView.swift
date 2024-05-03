//
//  ContentView.swift
//  networkinginswift
//
//  Created by ke on 2024/5/2.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = CoinsViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.coins) { coin in
                    Text(coin.name)
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
