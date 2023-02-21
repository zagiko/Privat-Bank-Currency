import UIKit
@MainActor

class CurrencyListTableViewController: UITableViewController, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text,
           searchString.isEmpty == false {
            filterItems = sequenceCurrency.filter({ (currency) -> Bool in currency.currency.localizedCaseInsensitiveContains(searchString)})
            tableView.reloadData()
        } else {
            filterItems = sequenceCurrency
        }
        tableView.reloadData()
        
    }
    
    
    var currencyListData: [CurrencyInfo] = []
    
    var sequenceCurrency: [CurrencyInfo] = []
    
    func reorderCurrencyXXX() {
        sequenceCurrency.append(contentsOf: currencyListData.filter({ $0.currency == "USD" }))
        sequenceCurrency.append(contentsOf: currencyListData.filter({ $0.currency == "EUR" }))
        sequenceCurrency.append(contentsOf: currencyListData.filter({ $0.currency == "GBP" }))
        sequenceCurrency.append(contentsOf: currencyListData.filter({ $0.currency != "USD" && $0.currency != "EUR" && $0.currency != "GBP" && $0.currency != "UAH" }))
        print(sequenceCurrency)
        print(currencyListData)
    }
    

    var search = UISearchController()
    
    var filterItems: [CurrencyInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let displayFormatter2 = DateFormatter()
        displayFormatter2.locale = Locale(identifier: "de_De")
        displayFormatter2.dateStyle = .medium
        
        let niceData = displayFormatter2.string(from: Date())
        
        navigationItem.title = "Курс Приват Банка на \(niceData)"
        
        navigationItem.searchController = search
        search.obscuresBackgroundDuringPresentation = false
        search.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = true
        
        
        Task {
            do {
                let recivedCurrencyData = try await fetchInfo()
                self.currencyListData = recivedCurrencyData.exchangeRate
                reorderCurrencyXXX()
                tableView.reloadData()
                
//                print(currencyListData)
//                recivedCurrencyData.exchangeRate.forEach { item in print("""
        
//        ***************************************
//
//        Валюта базова \(item.baseCurrency)
//
//        Валюта \(item.currency)
//
//        Курс НБУ \(item.saleRateNB)
//
//        Курс продажу \(item.purchaseRate ?? 0.0)
//
//        Курс покупки \(item.saleRate ?? 0.0)
//        """) }
                
            } catch {
                print(Error.itemNotFound)
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //        print(currencyListData)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if filterItems.isEmpty {
            return sequenceCurrency.count
        } else {
            return filterItems.count
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Currency cell", for: indexPath) as! CurrencyTableViewCell
        
        if filterItems.isEmpty {
            let currency = sequenceCurrency[indexPath.row]
            cell.updateCurrencyData(item: currency)
        } else {
            let search = filterItems[indexPath.row]
            cell.updateCurrencyData(item: search)
        }
        return cell
    }
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
