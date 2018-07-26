import UIKit
import FirebaseStorage

class GetJigsawImage: APIRequest {
    var method: RequestType = .GET
    var path: FirebasePath = .images
    var parameters: [String : String] = [:]
    var headers: [String: String] = [:]
    var isAuthRequired: Bool = true
    var body: Data? = nil

    init(url: String) {
        //TODO: Do somethig with it
    }
}
