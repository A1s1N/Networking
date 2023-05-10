//
//  NetworkServiceWithAsync.swift
//  Networking
//
//  Created by Никита Александров on 08.05.2023.
//

import Foundation

class NetworkServiceWithAsync {
    static let shared = NetworkServiceWithAsync(); private init() { }
    
    private func createURL() -> URL? {
        let tunnel = "https://"
        let server = "randomuser.me"
        let endPoint = "/api"
        let getParams = ""
        
        let urlStr = tunnel + server + endPoint + getParams
        
        let url = URL(string: urlStr)
        return url
    }
    
    func fetchData() async throws -> UserResults {
        guard let url = createURL() else {
            throw NetworkingError.badUrl
        }
        
        let responce = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(UserResults.self, from: responce.0)
        
        return result
    }
}
