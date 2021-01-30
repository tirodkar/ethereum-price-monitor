//
//  PriceViewController.swift
//  EthereumPriceMonitor
//
//  Created by Filip Baumgart on 30/01/2021.
//

import UIKit

final class PriceViewController: UIViewController {

  @IBOutlet weak private var mainStackView: UIStackView!
  @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
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
    mainStackView.isHidden = true
    activityIndicator.isHidden = false
    apiService.getEthereumPrice { [weak self] result in
      switch result {
      case .success(let crypto):
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self?.updatePriceLabel(with: crypto.name.price)
          self?.activityIndicator.isHidden = true
          self?.mainStackView.isHidden = false
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  private func updatePriceLabel(with value: Double) {
    currentPriceLabel.text = "1 ETH = \(String(value)) PLN"
  }
}
