import Dependencies
import Foundation

struct AssetsApiClient{
    var fetchAllAssets: () async throws -> [Asset]
}
enum NetworkingError: Error{
    case invalidURL
    
    var localizedDescription: String {
        switch self {
        case.invalidURL:
            return "Invalid URL"
        }
    }
}

extension AssetsApiClient: DependencyKey{
    static var liveValue: AssetsApiClient{
        .init(
            fetchAllAssets: {
                let urlSession = URLSession.shared
                
                guard let url = URL(string: "https://52594b46-fac1-4496-9184-5c4a27a1b3b3.mock.pstmn.io/v3/assets") else {
                    throw NetworkingError.invalidURL
                }
                
                let (data, _) = try await urlSession.data(for: URLRequest(url: url))
                let assetsResponse = try JSONDecoder().decode(AssetsResponse.self, from: data)
                
                return assetsResponse.data
            }
        )
    }
    
    //puedo definir un par de assets de ejemplo
    static var previewValue: AssetsApiClient{
        .init(
            fetchAllAssets: {[
                .init(
                    id: "bitcoin",
                    name: "Bitcoin",
                    symbol: "BTC",
                    priceUsd: "89999",
                    changePercent24Hr: "6.99"
                ),
                .init(
                    id: "ethreum",
                    name: "ethreum",
                    symbol: "ETH",
                    priceUsd: "89999213123213",
                    changePercent24Hr: "-21.434534543599"
                ),
                .init(
                    id: "solana",
                    name: "Solana",
                    symbol: "SOL",
                    priceUsd: "5000.21893718293721983",
                    changePercent24Hr: "5.99"
                )
            ]
                
            }
        )
    }
    
    static var testValue: AssetsApiClient{
        .init(fetchAllAssets: {
            reportIssue("AssetsApiClient.fetchAllAssets is unimplemented")
            return[]
        })
    }
}

//Registramos la dependencia
//Crea un contenedor con un diccionario
//Donde puede haber uno de cada elemento
extension DependencyValues {
    var assetsApiClient: AssetsApiClient{
        get { self[AssetsApiClient.self]}
        set { self[AssetsApiClient.self] = newValue}
    }
}
