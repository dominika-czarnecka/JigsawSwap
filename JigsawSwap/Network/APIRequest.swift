import UIKit
import FirebaseAuth

protocol APIRequest {
    var method: RequestType { get }
    var path: FirebasePath { get }
    var parameters: [String: String] { get }
    var headers: [String: String] { get }
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
            //TODO: Add authorization
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
}
