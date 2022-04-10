//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Duyi Li on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    
    var sendStockDelegate : SendStockDelegate?
    var stockSymbol = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func btnGetPrice(_ sender: Any) {
        let currentURL = getCurrentStockURL(stockSymbol)
        getCurrentStock(currentURL).done { stock in
            stock.Symbol = self.stockSymbol
            self.sendStockDelegate?.sendStockData(stock)
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
}
