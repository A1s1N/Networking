//
//  NetworkServiceWithCompletions.swift
//  Networking
//
//  Created by Никита Александров on 08.05.2023.
//

import Foundation

class NetworkServiceWithCompletions {
    static let shared = NetworkServiceWithCompletions(); private init() { }
    
    private func createURL() -> URL? {
        let tunnel = "https://"
        let server = "randomuser.me"
        let endPoint = "/api"
        let getParams = ""
        
        let urlStr = tunnel + server + endPoint + getParams
        
        let url = URL(string: urlStr)
        return url
    }
    
    func fetchData(completion: @escaping (Result<UserResults, Error>) -> ()) {
        guard let url = createURL() else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let usersData = try decoder.decode(UserResults.self, from: data)
                completion(.success(usersData))
            } catch {
                completion(.failure(NetworkingError.invalidData))
            }
        }.resume()
    }
}

enum NetworkingError: Error {
    case badUrl, badRequest, badPesponse, invalidData
}
