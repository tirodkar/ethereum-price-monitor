//
//  PriceViewController.swift
//  EthereumPriceMonitor
//
//  Created by Filip Baumgart on 30/01/2021.
//

import UIKit

final class PriceViewController: UIViewController {
  
  @IBOutlet weak private var loadingView: UIView!
  @IBOutlet weak private var currentPriceLabel: UILabel! { didSet {
    currentPriceLabel.text = ""
  }}
  private var price = 0
  private var apiService = APIService()
  
  override func viewDidLoad() {
    getEthereumPrice()
  }
  
  @IBAction private func updatePrice(_ sender: Any) {
    getEthereumPrice()
  }
  
  private func getEthereumPrice() {
    loadingView.isHidden = false
    apiService.getEthereumPrice { [weak self] result in
      switch result {
      case .success(let crypto):
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self?.updatePriceLabel(with: crypto.name.price)
          self?.loadingView.isHidden = true
        }
      case .failure(let error):
        print(error.localizedDescription)
        self?.loadingView.isHidden = true
      }
    }
  }
  
  private func updatePriceLabel(with value: Double) {
    currentPriceLabel.text = "1 ETH = \(String(value)) PLN"
  }
}
