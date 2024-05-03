//
//  CoinsViewModel.swift
//  networkinginswift
//
//  Created by ke on 2024/5/2.
//

import Foundation

@Observable
class CoinsViewModel {
    var coins = [Coin]()
    var errMessage: String?
    
    private var service = CoinDataService()
    
    init() {
        Task {
            try await fetchCoins()
        }
    }
    
    func fetchCoins() async throws{
        self.coins = try await  service.fetchCoins()
    }
    
    func fetchCoinsWithCompletionHandler() {
//        service.fetchCoins() { coins, error in
//            if let error = error {
//                self.errMessage = error.localizedDescription
//                return
//            }
//            
//            self.coins = coins ?? []
//        }
        
        service.fetchCoinsWithResult { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coins = coins
            case .failure(let error):
                self?.errMessage = error.localizedDescription
            }
        }
    }
}
