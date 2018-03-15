
import UIKit

enum DateFormatType: String {
    case dayAndMonth = "dd.MM"
    case monthMedium = "MMMM"
    case hour24 = "HH:mm"
    case dayMonthAndYear = "dd.MM.yyyy"
}

extension Formatter {
	
    static func dateFormater(_ format: DateFormatType) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = format.rawValue
        return formatter
    }

}

extension Date {
	
    func string(with format: DateFormatType) -> String {
        return Formatter.dateFormater(format).string(from: self)
    }
	
}
