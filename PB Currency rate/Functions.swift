
import Foundation

func fetchInfo() async throws -> Currency {

    let currentDate = Date()

    let displayFormatter = DateFormatter()
    displayFormatter.locale = Locale(identifier: "de_De")
    displayFormatter.dateStyle = .medium    

    let dateToURL = displayFormatter.string(from: currentDate)

    let request: [String: String] = ["date": dateToURL]

    var urlComponents = URLComponents(string: "https://api.privatbank.ua/p24api/exchange_rates?")!
    urlComponents.queryItems = request.map({URLQueryItem(name: $0.key, value: $0.value)})

    print(urlComponents.self)
    
    let (data, responce) = try await URLSession.shared.data(from: urlComponents.url!)
    
    guard let httpResponce = responce as? HTTPURLResponse, httpResponce.statusCode == 200 else { throw Error.itemNotFound }

    let jsonDecode = JSONDecoder()
    let encodedData = try jsonDecode.decode(Currency.self, from: data)
    return encodedData
}

enum Error: LocalizedError {
    case itemNotFound
}

