import Foundation
import Combine

typealias RequestPublisher<ReturnType> = AnyPublisher<ReturnType, NetworkRequestError>
