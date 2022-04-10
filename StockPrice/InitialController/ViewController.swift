//
//  ViewController.swift
//  StockPrice
//
//  Created by Duyi Li on 4/10/22.
//

import UIKit

class ViewController: UIViewController, SendStockDelegate {
    
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!
    
    
    var stocksModel: [StockQuoteModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        stocksModel = initializeStocks()
        
        let currentURL = getCurrentStockURL("AAPL")
        getCurrentStock(currentURL).done { stock in
            self.sendStockData(stock)
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
    
    func initializeStocks() -> [StockQuoteModel] {
        let apple = StockQuoteModel("AAPL")
        let facebook = StockQuoteModel("FB")
        let google = StockQuoteModel("GOOG")
        let microsoft = StockQuoteModel("MSFT")
        let amazon = StockQuoteModel("AMZN")
        
        var modelArr = [StockQuoteModel]()
        modelArr.append(apple)
        modelArr.append(facebook)
        modelArr.append(google)
        modelArr.append(microsoft)
        modelArr.append(amazon)
        
        return modelArr
    }
    
    func sendStockData(_ stock: StockQuoteModel) {
        lblSymbol.text = stock.Symbol
        lblCompany.text = stock.CompanyName
        lblPrice.text = "$\(stock.Price)"
        lblDayHigh.text = "$\(stock.DayHigh)"
        lblDayLow.text = "$\(stock.DayLow)"
    }
}

