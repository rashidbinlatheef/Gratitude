//
//  PexelAPI.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import Foundation

enum PexelNetworkingError: Error, LocalizedError {
    case dataDecodingError
    case unexpectedResponse
    case error(statusCode: Int, error: Error?)

    public var errorDescription: String? {
        switch self {
        case .dataDecodingError:
            return "Unable to decode data"
        case .unexpectedResponse:
            return "UnExpected Response"
        case .error(_ , error: let error):
            return error?.localizedDescription
        }
    }
}

//sourcery: AutoMockable
protocol PexelAPIService {
    func searchImages(querry: String, completion: @escaping (Result<PexelPhotoSearchResponse, PexelNetworkingError>) -> Void)
}

final class PexelAPI: PexelAPIService {
    static let sharedInstance = PexelAPI()
    
    private let baseURL = "https://api.pexels.com/v1/"
    private let apiKey = "563492ad6f91700001000001c7e503948bd54d9cbe1f523c9c0c2d6b"
    private let networkService: NetworkService

    private var defaultHeaders: [String: String]
    
    private init(
        networkService: NetworkService = NetworkManager.sharedInstance
    ) {
        self.networkService = networkService
        defaultHeaders = ["Authorization": apiKey]
    }
    
    func searchImages(querry: String, completion: @escaping (Result<PexelPhotoSearchResponse, PexelNetworkingError>) -> Void) {
        let urlString = baseURL + "search?"
        let parameters: [String: Any] = [
            "query": querry,
            "per_page": 20
        ]
        networkService.executeRequestWith(
            urlString: urlString,
            parameters: parameters,
            headers: defaultHeaders,
            method: .get) { data, response, error in
                if let error = error {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                    let ghError: PexelNetworkingError =  .error(statusCode: statusCode, error: error)
                    completion(.failure(ghError))
                } else if let data = data {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    guard let response = try? jsonDecoder.decode(PexelPhotoSearchResponse.self, from: data) else {
                        DispatchQueue.main.async {
                            completion(.failure(.dataDecodingError))
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        completion(.success(response))
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(.unexpectedResponse))
                    }
                }
            }
    }
}
