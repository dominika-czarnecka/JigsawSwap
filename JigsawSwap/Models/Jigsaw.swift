import Foundation

class Jigsaw: Codable {
    var id: String?
    var ownerID: String?
    var piecesCount: Int?
    var missingPiecesCount: Int?
    var description: String?
    var images: [String]?
    var addedDate: Double?
    
    init(_ id: String, owner: String, piecesCount: Int, missingPiecesCount: Int, description: String?, images: [String]?) {
        self.ownerID = owner
        self.piecesCount = piecesCount
        self.missingPiecesCount = missingPiecesCount
        self.description = description
        self.images = images
        self.addedDate = Date().timeIntervalSince1970
    }
}
