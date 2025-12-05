import Foundation
import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case networkError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .decodingError:
            return "Failed to decode data"
        case .networkError(let error):
            return error.localizedDescription
        }
    }
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let baseURL = "https://akabab.github.io/superhero-api/api"
    
    // Fetch Random Superhero (Alamofire)
    func fetchRandomSuperhero(completion: @escaping (Result<Superhero, NetworkError>) -> Void) {
        let randomId = Int.random(in: 1...731)
        fetchSuperhero(by: randomId, completion: completion)
    }
    
    // Fetch Superhero by ID (Alamofire)
    func fetchSuperhero(by id: Int, completion: @escaping (Result<Superhero, NetworkError>) -> Void) {
        let urlString = "\(baseURL)/id/\(id).json"
        
        print("Fetching superhero from: \(urlString)")
        
        AF.request(urlString).validate().responseDecodable(of: Superhero.self) { response in
            switch response.result {
            case .success(let superhero):
                print("✅ Successfully fetched: \(superhero.name)")
                completion(.success(superhero))
                
            case .failure(let error):
                print("❌ Network error: \(error)")
                completion(.failure(.networkError(error)))
            }
        }
    }
}
