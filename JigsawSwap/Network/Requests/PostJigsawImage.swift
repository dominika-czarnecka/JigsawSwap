import UIKit
import FirebaseStorage

class PostJigsawImage: APIRequest {
    var method: RequestType = .POST
    var path: FirebasePath = .images
    var parameters: [String : String] = ["uploadType": "media"]
    var isAuthRequired: Bool = true
    var body: Data? = nil
    
    init(image: UIImage, name: String) {
        body = UIImagePNGRepresentation(image)
        parameters["name"] =  name
    }
}
