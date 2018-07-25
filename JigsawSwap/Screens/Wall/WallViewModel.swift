import UIKit
import RxSwift
import RxCocoa

class WallViewModel {
    var jigsaws: BehaviorRelay<[Jigsaw]> = BehaviorRelay.init(value: [])
    var jigsawsCount: UInt = 10
}
