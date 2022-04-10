//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by Duyi Li on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

func getCurrentStockURL(_ stockSymbol : String) -> String{
    let url = "\(stockQuoteURL)\(stockSymbol)?apikey=\(apiKey)"
    return url
}

func getCurrentStock(_ url : String) -> Promise<StockQuoteModel>{
    
    return Promise<StockQuoteModel> { seal -> Void in
        
        AF.request(url).responseJSON { response in
        
            if response.error != nil {
                seal.reject(response.error!)
            }
            
            let stock = StockQuoteModel("")

            let stockArray = JSON(response.data!).arrayValue
            
            guard let stockData = stockArray.first else {return seal.fulfill(stock)}
            
            stock.Symbol = stockData["symbol"].stringValue
            stock.CompanyName = stockData["name"].stringValue
            stock.Price = stockData["price"].doubleValue
            stock.DayHigh = stockData["dayHigh"].doubleValue
            stock.DayLow = stockData["dayLow"].doubleValue
            seal.fulfill(stock)

        }
    }
}

