import UIKit

final class AddJigsawViewModel {
    
    var piecesCount: Int?
    var missingPiecesCount: Int?
    var description: String?
    
    lazy var jigsaw: Jigsaw? = {
        guard let piecesCount = piecesCount, let missingPiecesCount = missingPiecesCount, let description = description else { return nil }
        //TODO: Add real userID
        return Jigsaw("", owner:"1", piecesCount: piecesCount, missingPiecesCount: missingPiecesCount, description: description, images: nil)
    }()
}
