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

    func downloadCoinsContinuation(url:URL) async {
        do{
            let coins = try await fetchCoins.fetchCoinsContinuation(url: url)
            DispatchQueue.main.async {
                self.coinList = coins.map(CoinViewModel.init)
            }
        }catch{
            print(error)
        }
    }
}
