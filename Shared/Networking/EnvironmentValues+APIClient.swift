import SwiftUI

struct APIClientEnvironmentKey: EnvironmentKey {
    static let defaultValue: APIClient = DefaultAPIClient.shared
}

extension EnvironmentValues {
    var apiClient: APIClient {
        get {
            self[APIClientEnvironmentKey.self]
        }
        set {
            self[APIClientEnvironmentKey.self] = newValue
        }
    }
}
