import Foundation
import UIKit

final class AddJigsawViewController: BaseViewController<AddJigsawView> {
    private let viewModel = AddJigsawViewModel()
    
    override func setupReactiveBinding() {
        
        customView.piecesCountTextFiled.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.customView.piecesCountTextFiled.isValid()
            })
            .disposed(by: disposeBag)
        customView.missingPiecenCountTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.customView.missingPiecenCountTextField.isValid()
            })
            .disposed(by: disposeBag)
        customView.descriptionTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.customView.descriptionTextField.isValid()
            })
            .disposed(by: disposeBag)
    }
}
