import UIKit

final class AddJigsawView: BaseView {
    let piecesCountTextFiled: ValidationTextField = {
       let textField = ValidationTextField(ValidationType.int, defaultString: "1000")
        textField.placeholder = "AddJigsaw.PiecesCount".localized
        return textField
    }()
    let missingPiecenCountTextField: ValidationTextField = {
        let textField = ValidationTextField(ValidationType.int, defaultString: "0")
        textField.placeholder = "AddJigsaw.MissingPiecesCount".localized
        return textField
    }()
    let descriptionTextField: ValidationTextField = {
        let textField = ValidationTextField(ValidationType.none)
        textField.placeholder = "AddJigsaw.Description".localized
        return textField
    }()
    let addImageButton: NormalButton = {
        let button = NormalButton()
        button.setTitle("AddJigsaw.AddImage".localized, for: .normal)
        return button
    }()
    let cancelButton: SmallButton = {
       let button = SmallButton()
        //TODO: Add image
        button.setTitle("X", for: .normal)
        return button
    }()
    
    override func configureConstraints() {
        [piecesCountTextFiled, missingPiecenCountTextField, descriptionTextField, addImageButton, cancelButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        addConstraints([
            piecesCountTextFiled.bottomAnchor.constraint(equalTo: missingPiecenCountTextField.topAnchor, constant: -CGFloat.LayoutDimensions.margin),
            piecesCountTextFiled.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addConstraints([
            missingPiecenCountTextField.bottomAnchor.constraint(equalTo: descriptionTextField.topAnchor, constant: -CGFloat.LayoutDimensions.margin),
            missingPiecenCountTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addConstraints([
            descriptionTextField.bottomAnchor.constraint(equalTo: addImageButton.topAnchor, constant: -CGFloat.LayoutDimensions.margin * 4),
            descriptionTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTextField.widthAnchor.constraint(equalTo: piecesCountTextFiled.widthAnchor),
            descriptionTextField.heightAnchor.constraint(equalTo: piecesCountTextFiled.heightAnchor)
        ])
        addConstraints([
            addImageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addImageButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat.LayoutDimensions.margin * 2 + (UIApplication.shared.keyWindow?.rootViewController?.additionalSafeAreaInsets.bottom ?? 0))
        ])
        addConstraints([
            cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.LayoutDimensions.margin + (UIApplication.shared.keyWindow?.rootViewController?.additionalSafeAreaInsets.top ?? 0)),
            cancelButton.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat.LayoutDimensions.margin + (UIApplication.shared.keyWindow?.rootViewController?.additionalSafeAreaInsets.left ?? 0))
        ])
    }
}
