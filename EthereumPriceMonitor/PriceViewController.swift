//
//  PriceViewController.swift
//  EthereumPriceMonitor
//
//  Created by Filip Baumgart on 30/01/2021.
//

import UIKit

final class PriceViewController: UIViewController {
  
  @IBOutlet weak private var currentPriceLabel: UILabel! { didSet {
    currentPriceLabel.text = ""
  }}
  private var price = 0
  
  @IBAction private func updatePrice(_ sender: Any) {
    price += 100
    currentPriceLabel.text = String(price)
  }
}
