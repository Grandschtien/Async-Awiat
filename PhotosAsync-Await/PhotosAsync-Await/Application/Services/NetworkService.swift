//
//  NetworkService.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    static func loadPhoto(urlString: String) async throws -> Data
    func getData(start: Int, limit: Int) async throws -> Data
}

final class NetworkService: NetworkServiceProtocol {
    static func loadPhoto(urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw URLError(.notConnectedToInternet)
        }
        
        guard response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return data
    }
    
    func getData(start: Int, limit: Int) async throws -> Data {
        guard let url = URL.with(string: "_start=\(start)&_limit=\(limit)") else {
            throw URLError(.badURL)
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw URLError(.notConnectedToInternet)
        }
        
        guard response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}

extension URL {
    private static var baseUrl: String {
        return "https://jsonplaceholder.typicode.com/photos?"
    }
    
    static func with(string: String) -> URL? {
        return URL(string: "\(baseUrl)\(string)")
    }
}

