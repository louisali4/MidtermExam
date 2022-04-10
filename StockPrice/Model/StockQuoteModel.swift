//
//  StockQuoteModel.swift
//  StockPrice
//
//  Created by Duyi Li on 4/10/22.
//

import Foundation

// Company Name, Symbol, Price, Day High and Day low

class StockQuoteModel{
    init(_ symbol : String) {
        self.Symbol = symbol
    }
    
    var CompanyName = "Apple"
    var Symbol = "AAPL"
    var Price = -1.0
    var DayHigh = -1.0
    var DayLow = -1.0
}
