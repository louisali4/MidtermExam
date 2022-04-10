//
//  SendStockDelegate.swift
//  StockPrice
//
//  Created by Duyi Li on 4/10/22.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ stockModel : StockQuoteModel)
}
