import UIKit
import RxSwift
import RxCocoa

class WallViewModel {
    var jigsaws: BehaviorRelay<[Jigsaw]> = BehaviorRelay.init(value: [])
    var jigsawsCount: Int = 15
    var step: Int = 15
}
