import UIKit

enum ValidationType {
    case mail
    case name
    case surname
    case password
    case none
    
    func generateCustomPasswordRegex(oneLowercased: Bool = true, oneUppercased: Bool = true, oneNumber: Bool = true, oneSpecial: Bool = true, minLenght: Int = 8, maxLenght: Int = 64) -> String {
        var regexString = "^"
        
        if oneLowercased { regexString.append("(?=.*[a-ząćęłńóśźż])") }
        if oneUppercased { regexString.append("(?=.*[A-ZĄĆĘŁŃÓŚŹŻ])") }
        if oneNumber { regexString.append("(?=.*[0-9])") }
        if oneSpecial { regexString.append("(?=.*[ !\"\"#()*+,\\-.\\/:;&'<=>?%@^_`{|}~$\\[\\\\\\]])") }
        regexString.append("[A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ\\d// !\"\"#()*+,\\-.\\/:;&'<=>?%@^_`{|}~$\\[\\\\\\]]")
        regexString.append("{\(minLenght),\(maxLenght)}$")
        
        return regexString
    }
    
    func validationRegex() -> String {
        switch self {
        case .mail:
            return "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        case .name:
            return "^[A-Z]+[a-z]*([ -][A-Z][a-z]*)*$"
        case .surname:
            return "^[A-Z]+[a-z]*([ -][A-Z][a-z]*)*?$"
        case .password:
            return "^(?=.*[a-ząćęłńóśźż])(?=.*[A-ZĄĆĘŁŃÓŚŹŻ])(?=.*\\d)(?=.*[ !\"\"#()*+,\\-.\\/:;&'<=>?%@^_`{|}~$\\[\\\\\\]])[A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ\\d !\"\"#()*+,\\-.\\/:;&'<=>?%@^_`{|}~$\\[\\\\\\]]{8,64}"
        case .none:
            return ""
        }
    }
    
    func errorMessage() -> String {
        switch self {
        case .name:
            return "ValidationRegex.Name.ErrorMessage".localized
        case .surname:
            return "ValidationRegex.Surname.ErrorMessage".localized
        case .mail:
            return "ValidationRegex.Mail.ErrorMessage".localized
        case .password:
            return "ValidationRegex.Password.ErrorMessage".localized
        case .none:
            return "ValidationRegex.None.ErrorMessage".localized
        }
    }
    
    func placeholder() -> String {
        switch self {
        case .mail:
            return "ValidationRegex.Mail.Placholder".localized
        case .name:
            return "ValidationRegex.Name.Placholder".localized
        case .surname:
            return "ValidationRegex.Surname.Placholder".localized
        case .password:
            return "ValidationRegex.Password.Placholder".localized
        case .none:
            return "ValidationRegex.None.Placholder".localized
        }
    }
}
