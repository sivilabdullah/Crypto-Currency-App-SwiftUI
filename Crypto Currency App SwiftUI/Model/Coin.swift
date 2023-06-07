//
//  Coin.swift
//  Crypto Currency App SwiftUI
//
//  Created by abdullah's Ventura on 7.06.2023.
//

import Foundation

struct Coin: Codable , Identifiable{
    let id: String
    let rank: String
    let symbol: String
    let name: String
    let supply: String
    let maxSupply: String?
    let marketCapUsd: String?
    let volumeUsd24Hr: String?
    let priceUsd: String
    let changePercent24Hr: String?
    let vwap24Hr: String?
    let explorer: String?
    
    
    
    
    //diyelim ki id cekecegimiz api de yok yukarida yazip codinkeys de tanimlamazsak her veriye id ekler asagida tanimlamamizin sebebi apiden cekecegimiz verinin adi xcoda da tanimlanamayacak bir sey ise bunu duzeltmemize izin vermesi
    /*
     hashable kullanimi tavsiye edilir codable yazan kisima 
    private enum CodinKeys : String, CodinKeys{
        case currency = "currency"
        case price = "price"
    }
    
     */
    
}
