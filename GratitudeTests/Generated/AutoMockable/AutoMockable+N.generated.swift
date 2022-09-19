// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class NetworkServiceMock: NetworkService {
    var sessionManager: URLSession?

    //MARK: - executeRequestWith

    var executeRequestWithUrlStringParametersHeadersMethodCompletionCallsCount = 0
    var executeRequestWithUrlStringParametersHeadersMethodCompletionCalled: Bool {
        return executeRequestWithUrlStringParametersHeadersMethodCompletionCallsCount > 0
    }
    var executeRequestWithUrlStringParametersHeadersMethodCompletionReceivedArguments: (urlString: String, parameters: [String: Any]?, headers: [String: String]?, method: RequestMethod?, completion: (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ())?
    var executeRequestWithUrlStringParametersHeadersMethodCompletionReceivedInvocations: [(urlString: String, parameters: [String: Any]?, headers: [String: String]?, method: RequestMethod?, completion: (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ())] = []
    var executeRequestWithUrlStringParametersHeadersMethodCompletionClosure: ((String, [String: Any]?, [String: String]?, RequestMethod?, @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()) -> Void)?

    func executeRequestWith(urlString: String, parameters: [String: Any]?, headers: [String: String]?, method: RequestMethod?, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()) {
        executeRequestWithUrlStringParametersHeadersMethodCompletionCallsCount += 1
        executeRequestWithUrlStringParametersHeadersMethodCompletionReceivedArguments = (urlString: urlString, parameters: parameters, headers: headers, method: method, completion: completion)
        executeRequestWithUrlStringParametersHeadersMethodCompletionReceivedInvocations.append((urlString: urlString, parameters: parameters, headers: headers, method: method, completion: completion))
        executeRequestWithUrlStringParametersHeadersMethodCompletionClosure?(urlString, parameters, headers, method, completion)
    }

}
