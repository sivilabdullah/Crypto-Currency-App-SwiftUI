//
//  Service.swift
//  Crypto Currency App SwiftUI
//
//  Created by abdullah's Ventura on 7.06.2023.
//

import Foundation

class WebService{
    
    var coins: [Coin] = []
    // continuation herhangi bir fonksiyonu async hale getirmeye yarar
    func fetchCoinsContinuation(url: URL) async throws-> [Coin]{
        try await  withCheckedThrowingContinuation({ continuation in
            fetchCoins(url: url) { result in
                switch result {
                case .success(let coins):
                    continuation.resume(returning: coins ?? [])
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
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
    
}
enum DownloaderError: Error {
    case badURL
    case noData
    case dataParseError
}
