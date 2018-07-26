import Foundation

class AddJigsawRequest: APIRequest {
    var method: RequestType = .POST
    var path: FirebasePath = .jigsaws
    var parameters: [String : String] = [:]
    var headers: [String: String] = [:]
    var isAuthRequired: Bool = true
    var body: Data? = nil
    
    init(_ jigsaw: Jigsaw) {
        do {
            body = try JSONEncoder().encode(jigsaw)
        } catch {
            print(error)
        }
    }
    
    init(_ jigsaws: [Jigsaw]) {
        body = try? JSONEncoder().encode(jigsaws)
    }
}
