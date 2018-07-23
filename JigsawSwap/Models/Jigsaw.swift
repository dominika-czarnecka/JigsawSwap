class Jigsaw: Codable {
    var ownerID: String?
    var piecesCount: Int?
    var missingPiecesCount: Int?
    var description: String?
    var images: [String]?
    
    init(_ owner: String, piecesCount: Int, missingPiecesCount: Int, description: String?, images: [String]?) {
        self.ownerID = owner
        self.piecesCount = piecesCount
        self.missingPiecesCount = missingPiecesCount
        self.description = description
        self.images = images
    }
}
