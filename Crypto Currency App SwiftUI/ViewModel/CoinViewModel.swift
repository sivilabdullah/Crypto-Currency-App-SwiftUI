//
//  CoinViewModel.swift
//  Crypto Currency App SwiftUI
//
//  Created by abdullah's Ventura on 7.06.2023.
//

import Foundation
import SwiftUI
struct CoinViewModel{
    let coinInfo : Coin
    var id : String{
        return coinInfo.id
    }
    var rank : String{
        return coinInfo.rank
    }
    var symbol : String{
        return coinInfo.symbol
    }
    var name : String{
        return coinInfo.name
    }
    var supply : String{
        return coinInfo.supply
    }
    var maxSupply: String{
        return coinInfo.maxSupply ?? "nil"
    }
    var marketCapUsd: String{
        return coinInfo.marketCapUsd ?? "nil"
    }
    var volumeUsd24Hr: String{
        return coinInfo.volumeUsd24Hr ?? "nil"
    }
    var priceUsd: String{
        return coinInfo.priceUsd
    }
    var changePercent24Hr: String{
        return coinInfo.changePercent24Hr ?? "nil"
    }
    var vwap24Hr: String{
        return coinInfo.vwap24Hr ?? "nil"
    }
    var explorer: String{
        return coinInfo.explorer ?? "nil"
    }
}
//ObservableObject combine frameworkundan bir obje
class CoinListViewModel: ObservableObject{
    @Published var coinList = [CoinViewModel]()
    
    let fetchCoins = WebService()

    func downloadCoinsAsync(url: URL ) async {
        do{
            let coins =  try await fetchCoins.fetchCoinsAsync(url: url)
            DispatchQueue.main.async {
                if let coins = coins{
                    self.coinList = coins.map(CoinViewModel.init)
                }
              
            }
        }catch{
            print("download async error: \(error)")
        }
    }
    /*
    func downloadCoin(url: URL){
        fetchCoins.fetchCoins(url: url) { result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let coins):
                if let coins = coins{
                    DispatchQueue.main.async {
                        self.coinList = coins.map(CoinViewModel.init)
                    }
                }
            }
        }
    }
    */
    
    
    
    
    
    
    
    /*
    let coinList: [Coin]

    func numberInSection() -> Int{
        return self.coinList.count
    }
    func cryptoAtIndex(_ index: Int) -> CoinViewModel{
        let coins = self.coinList[index]
        return CoinViewModel(coinInfo: coins)
    }
    */
    
}
