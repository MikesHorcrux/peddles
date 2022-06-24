import Foundation

extension Date {
    var iso8601withFractionalSeconds: String {
        return Formatter.iso8601withFractionalSeconds.string(from: self)
    }

    static var now: Date {
        .init()
    }

    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter.string(from: self)
    }

    var formattedDay: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
    func to(timeZone outputTimeZone: TimeZone, from inputTimeZone: TimeZone) -> Date {
         let delta = TimeInterval(outputTimeZone.secondsFromGMT(for: self) - inputTimeZone.secondsFromGMT(for: self))
         return addingTimeInterval(delta)
    }
}

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}

extension Formatter {
    static let iso8601withFractionalSeconds = ISO8601DateFormatter([.withInternetDateTime, .withFractionalSeconds])
}

extension String {
    var iso8601withFractionalSeconds: Date? { return Formatter.iso8601withFractionalSeconds.date(from: self) }
}
