import Combine
import Foundation
import SwiftUI

protocol APIClient {
    var accessToken: String? { get }
    func assign(accessToken: String)
    func dispatch<R: Request>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError>
}

final class DefaultAPIClient: APIClient {
    
    static let shared = DefaultAPIClient(baseURL: "https://api.petfinder.com/v2")
    
    private let baseURL: String
    private let networkDispatcher: NetworkDispatcher
    
    private var headers: [String: String] = [
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
    
    init(baseURL: String,
         networkDispatcher: NetworkDispatcher = NetworkDispatcher()
         // override: String = ""
    ) {
        self.baseURL = baseURL
        self.networkDispatcher = networkDispatcher
        // self.override = override
    }
    
    var accessToken: String? {
        headers["Authorization"]
    }
    
    func assign(accessToken: String) {
        headers["Authorization"] = "Bearer \(accessToken)"
        print("🔐 Token Assigned")
    }
    
    /// Dispatches a Request and returns a publisher
    /// - Parameter request: Request to Dispatch
    /// - Returns: A publisher containing decoded data or an error
    func dispatch<R: Request>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        guard !request.isMocked else {
            return request
                .mock()
                .eraseToAnyPublisher()
        }
        guard let urlRequest = request.asURLRequest(baseURL: baseURL, sharedHeaders: headers) else {
            return Fail(outputType: R.ReturnType.self, failure: NetworkRequestError.badRequest).eraseToAnyPublisher()
        }
        return networkDispatcher
            .dispatch(request: urlRequest)
            .eraseToAnyPublisher()
    }
}

#if DEBUG

final class InMemoryAPIClient: APIClient {
    var accessToken: String?
    
    private var responseByRequest: [String: Any] = [:]
    private var performedRequests: [String: Any] = [:]
    
    func lastPerformed<R: Request>(_ request: R.Type) -> R? {
        performedRequests["\(request)"] as? R
    }
    
    func respond<R: Request, A>(to request: R.Type, with response: A) where R.ReturnType == A {
        responseByRequest["\(request)"] = response
    }
    
    func assign(accessToken: String) {
        self.accessToken = accessToken
    }
    
    func dispatch<R: Request>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        performedRequests[key(for: request)] = request
        
        if let response = responseByRequest[key(for: request)] as? R.ReturnType {
            return Just(response)
                .setFailureType(to: NetworkRequestError.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: NetworkRequestError.notFound)
                .eraseToAnyPublisher()
        }
    }
    
    private func key<R: Request>(for request: R) -> String {
        String(describing: type(of: request))
    }
}

#endif
