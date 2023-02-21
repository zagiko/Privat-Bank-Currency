import Foundation

extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try?
                JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try?
                JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON Object")
            return
        }
        print(prettyJSONString)
    }
}

struct Currency: Codable {
    let baseCurrencyLit: String
    let bank: String
    let baseCurrency: Int
    let exchangeRate: [CurrencyInfo]
}

struct CurrencyInfo: Codable, Comparable {
    static func < (lhs: CurrencyInfo, rhs: CurrencyInfo) -> Bool {
        lhs.currency < rhs.currency
    }
    
    let purchaseRate: Float?
    let currency: String
    let baseCurrency: String
    let saleRateNB: Float
    let purchaseRateNB: Float
    let saleRate: Float?
}

