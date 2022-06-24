import Foundation

extension Error {
    var identifiable: IdentifiableError {
        .init(wrapped: self)
    }

    var equatable: EquatableError {
        .init(wrapped: self)
    }
}

struct IdentifiableError: LocalizedError, Identifiable {
    let wrapped: Error
    let id = UUID()

    var errorDescription: String? {
        wrapped.localizedDescription
    }
}

struct EquatableError: LocalizedError, Equatable {
    let wrapped: Error

    var errorDescription: String? {
        wrapped.localizedDescription
    }

    static func == (left: Self, right: Self) -> Bool {
        left.errorDescription == right.errorDescription
    }
}
