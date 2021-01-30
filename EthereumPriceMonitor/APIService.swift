//
//  APIService.swift
//  EthereumPriceMonitor
//
//  Created by Filip Baumgart on 30/01/2021.
//

import Foundation

final class APIService {
  
  func getEthereumPrice(completionHandler: @escaping (Result<Cryptocurrency, Error>) -> Void) {
    let url = "https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=pln"
    if let url = URL(string: url) {
      URLSession.shared.dataTask(with: url) { data, _, error in
        if let data = data {
          do {
            let json: Cryptocurrency = try JSONDecoder().decode(Cryptocurrency.self, from: data)
            completionHandler(.success(json))
          } catch let error {
            print(error.localizedDescription)
          }
        }
      }.resume()
    }
  }
}
