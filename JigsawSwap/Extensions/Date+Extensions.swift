import UIKit

enum DateFormatType: String {
    case dayMonth = "dd.MM"
    case monthMedium = "MMMM"
    case hour24 = "HH:mm"
    case dayMonthYear = "dd.MM.yyyy"
}

extension DateFormatter {
    convenience init(with format: DateFormatType) {
        self.init()
        self.timeZone = .current
        self.dateFormat = format.rawValue
    }
}

extension Date {
    func string(with format: DateFormatType) -> String {
        return DateFormatter(with: format).string(from: self)
    }
}
