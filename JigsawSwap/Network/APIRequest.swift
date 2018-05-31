import UIKit
import FirebaseAuth

protocol APIRequest {
    var method: RequestType { get }
    var path: FirebasePath { get }
    var parameters: [String : String] { get }
    var isAuthRequired: Bool { get }
    var body: Data? { get set }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent("\(path.rawValue).json"), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }

        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
    
        if isAuthRequired {
//            let auth = Auth.auth().currentUser?.providerID
//            components.user = "admin"
//            components.password = "admin"
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
