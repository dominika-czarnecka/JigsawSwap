import Foundation

class JigsawsForWallRequest: APIRequest {
    var method: RequestType = .GET
    var path: FirebasePath = .jigsaws
    var parameters: [String: String] = ["orderBy": "\"addedDate\""]
    var headers: [String: String] = [:]
    var isAuthRequired: Bool = false
    var body: Data? = nil
    
    init(_ jigsawsCount: Int) {
        parameters["limitToFirst"] = jigsawsCount.description
    }
}
