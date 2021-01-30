//
//  Cryptocurrency.swift
//  EthereumPriceMonitor
//
//  Created by Filip Baumgart on 30/01/2021.
//

struct Cryptocurrency: Decodable {
  let name: Ethereum
  
  enum CodingKeys: String, CodingKey {
    case name = "ethereum"
  }
  
  struct Ethereum: Decodable {
    let price: Double
    
    enum CodingKeys: String, CodingKey {
      case price = "pln"
    }
  }
}
