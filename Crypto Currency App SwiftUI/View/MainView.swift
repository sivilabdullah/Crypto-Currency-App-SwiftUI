//
//  ContentView.swift
//  Crypto Currency App SwiftUI
//
//  Created by abdullah's Ventura on 7.06.2023.
//

import SwiftUI
//crypto currency = coin
//currencies = response
struct MainView: View {
    @ObservedObject var coinListViewModel : CoinListViewModel
    init(){
        self.coinListViewModel = CoinListViewModel()
    }
    var url = URL(string: "https://api.coincap.io/v2/assets")!
    var body: some View {
        NavigationView {
            List(coinListViewModel.coinList,id:\.id){coin in
                VStack{
                    Text(coin.name)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(coin.priceUsd)
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.navigationTitle(Text("Coin Price List"))
        }.task {
            await coinListViewModel.downloadCoinsContinuation(url: url)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
