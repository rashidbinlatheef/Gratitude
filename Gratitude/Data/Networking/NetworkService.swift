//
//  NetworkService.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case requestCreationFailed
    public var errorDescription: String? {
        "NetworkError.Unable to create Request"
    }
}

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

//sourcery: AutoMockable
protocol NetworkService {
    var sessionManager: URLSession? {get}
    
    func executeRequestWith(
        urlString: String,
        parameters: [String: Any]?,
        headers: [String: String]?,
        method: RequestMethod?,
        completion: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()
    )
}

extension NetworkService {
    func executeRequestWith(
        urlString: String,
        parameters: [String: Any]?,
        headers: [String: String]?,
        method: RequestMethod?,
        completion: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()
    ) {
        guard let request = prepareURLRequest(urlString: urlString, parameters: parameters, headers: headers, method: method) else {
            completion(nil, nil, NetworkError.requestCreationFailed)
            return
        }
        let urlSessionTask = sessionManager?.dataTask(with: request, completionHandler: { data, response, error in
            completion(data, response, error)
        })
        urlSessionTask?.resume()
    }
    
    private func prepareURLRequest(urlString: String, parameters: [String: Any]? = nil, headers: [String: String]? = nil, method: RequestMethod? = .get) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }

        var request = URLRequest(url: url)
        
        if let params = parameters {
            if method == .get || method == .delete {
                guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
                    return nil
                }
                let queryItems = params.map {
                    URLQueryItem(name: $0.key, value: String(describing: $0.value))
                }
                urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
                guard let newURL = urlComponents.url else {
                    return nil
                }
                request = URLRequest(url: newURL)
            } else {
                let jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                request.httpBody = jsonData
            }
        }
        
        request.httpMethod = method?.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let requestHeaders = headers {
            for (field, value) in requestHeaders {
                request.setValue(value, forHTTPHeaderField: field)
            }
        }
        return request
    }
}
