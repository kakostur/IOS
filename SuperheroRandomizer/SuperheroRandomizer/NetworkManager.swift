import Foundation
import UIKit

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
    
    // getting random superhero
    func fetchRandomSuperhero(completion: @escaping (Result<Superhero, NetworkError>) -> Void) {
        // ID from 1 to 731
        let randomId = Int.random(in: 1...731)
        fetchSuperhero(by: randomId, completion: completion)
    }
    
    // getting gero by ID
    func fetchSuperhero(by id: Int, completion: @escaping (Result<Superhero, NetworkError>) -> Void) {
        let urlString = "\(baseURL)/id/\(id).json"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let superhero = try decoder.decode(Superhero.self, from: data)
                completion(.success(superhero))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
    
    // upload image
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            completion(image)
        }
        
        task.resume()
    }
}
