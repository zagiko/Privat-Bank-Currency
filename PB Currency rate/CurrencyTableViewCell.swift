
import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var exchangeCurrencyLabel: UILabel!
    @IBOutlet weak var nbuRateLabel: UILabel!
    @IBOutlet weak var saleRateLabel: UILabel!
    @IBOutlet weak var purchaseRateLabel: UILabel!
    
    @IBOutlet weak var baseCurrencyValueLabel: UILabel!
    @IBOutlet weak var exchangeCurrencyValueLabel: UILabel!
    @IBOutlet weak var nbuRateValueLabel: UILabel!
    @IBOutlet weak var saleRateValueLabel: UILabel!
    @IBOutlet weak var purchaseRateValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
       
    func updateCurrencyData(item: CurrencyInfo) {
        
        var flag: Character {
            
            switch item.currency  {
                
            case "AUD" :
                return "🇦🇺"
                
            case "AZN" :
                return "🇦🇿"
                
            case "BYN" :
                return "🇧🇾"
                
            case "CAD" :
                return "🇨🇦"
                
            case "CHF" :
                return "🇨🇭"
                
            case "CNY" :
                return "🇨🇳"
                
            case "CZK" :
                return "🇨🇿"
                
            case "DKK" :
                return "🇩🇰"
                
            case "EUR" :
                return "🇪🇺"
                
            case "GBP" :
                return "🇬🇧"
                
            case "GEL" :
                return "🍀"
                
            case "HUF" :
                return "🇭🇺"
                
            case "ILS" :
                return "🇮🇱"
                
            case "JPY" :
                return "🇯🇵"
                
            case "KZT" :
                return "🇰🇿"
                
            case "MDL" :
                return "🇲🇩"
                
            case "NOK" :
                return "🇳🇴"
                
            case "PLN" :
                return "🇵🇱"
                
            case "SEK" :
                return "🇸🇪"
                
            case "SGD" :
                return "🇸🇬"
                
            case "TMT" :
                return "🇹🇲"
                
            case "TRY" :
                return "🇹🇷"
                
            case "UAH" :
                return "🇺🇦"
                
            case "USD" :
                return "🇺🇸"
                
            case "UZS" :
                return "🇺🇿"
                
            case "XAU" :
                return "🏅"
                
            default:
                return "🏳️‍🌈"
                
            }

        }
        
        var flag2: Character {
            
            switch item.baseCurrency  {
                
            case "AUD" :
                return "🇦🇺"
                
            case "AZN" :
                return "🇦🇿"
                
            case "BYN" :
                return "🇧🇾"
                
            case "CAD" :
                return "🇨🇦"
                
            case "CHF" :
                return "🇨🇭"
                
            case "CNY" :
                return "🇨🇳"
                
            case "CZK" :
                return "🇨🇿"
                
            case "DKK" :
                return "🇩🇰"
                
            case "EUR" :
                return "🇪🇺"
                
            case "GBP" :
                return "🇬🇧"
                
            case "GEL" :
                return "🍀"
                
            case "HUF" :
                return "🇭🇺"
                
            case "ILS" :
                return "🇮🇱"
                
            case "JPY" :
                return "🇯🇵"
                
            case "KZT" :
                return "🇰🇿"
                
            case "MDL" :
                return "🇲🇩"
                
            case "NOK" :
                return "🇳🇴"
                
            case "PLN" :
                return "🇵🇱"
                
            case "SEK" :
                return "🇸🇪"
                
            case "SGD" :
                return "🇸🇬"
                
            case "TMT" :
                return "🇹🇲"
                
            case "TRY" :
                return "🇹🇷"
                
            case "UAH" :
                return "🇺🇦"
                
            case "USD" :
                return "🇺🇸"
                
            case "UZS" :
                return "🇺🇿"
                
            case "XAU" :
                return "🏅"
                
            default:
                return "🏳️‍🌈"
                
            }
            
        }
        
        baseCurrencyValueLabel.text = "\(flag2) " +  item.baseCurrency
        exchangeCurrencyValueLabel.text = "\(flag) " + item.currency
        
        nbuRateValueLabel.text = String(NSString(format: "%.2f", item.saleRateNB))
        
        
        if let saleRateUnwraped = item.saleRate {
            saleRateValueLabel.text = String(NSString(format: "%.2f", saleRateUnwraped))
            
        } else {
            saleRateValueLabel.text = "0.00"
        }
        
        if let purchaseRateUnwraped = item.purchaseRate {
            purchaseRateValueLabel.text = String(NSString(format: "%.2f", purchaseRateUnwraped))
        } else {
            purchaseRateValueLabel.text = "0.00"
        }
        
        
        
    }
    
}
