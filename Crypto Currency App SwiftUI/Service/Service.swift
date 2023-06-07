//
//  Service.swift
//  Crypto Currency App SwiftUI
//
//  Created by abdullah's Ventura on 7.06.2023.
//

import Foundation

class WebService{
    
    var coins: [Coin] = []
    
    func fetchCoinsAsync(url: URL) async throws -> [Coin]?{
       let (data, _) = try await URLSession.shared.data(from: url)
        let coins = try JSONDecoder().decode(Data.self, from: data)
        return coins.data
    }
    
    /*
    func fetchCoins(url: URL, completion: @escaping (Result<[Coin]?,DownloaderError>) -> Void){
        
       
        
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let error = error {
                 print(error.localizedDescription)
                 completion(.failure(.badURL))
             }
            guard let data = data , error == nil else{
                completion(.failure(.noData))
                return
            }
            do{
                let response = try JSONDecoder().decode(Data.self, from: data)
                completion(.success(response.data))
            }catch{
                print("error decoding Json: \(error)")
                completion(.failure(.dataParseError))
            }
         }.resume()
    }
    
    
    */
    
}
enum DownloaderError: Error {
    case badURL
    case noData
    case dataParseError
}
