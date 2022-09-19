//
//  NetworkManager.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 11/09/22.
//

import Foundation

final class NetworkManager: NetworkService {
    static var sharedInstance = NetworkManager()

    private var _sessionManager: URLSession?

    var sessionManager: URLSession? {
        if _sessionManager == nil {
            let configuration = URLSessionConfiguration.default
            configuration.tlsMinimumSupportedProtocolVersion = tls_protocol_version_t.TLSv12
            configuration.timeoutIntervalForRequest = 30
            configuration.timeoutIntervalForResource = 30
            _sessionManager = URLSession(configuration: configuration)
        }
        return _sessionManager
    }
}
