import UIKit

final class AddJigsawView: BaseView {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .lightPink
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    let addImageButton: UIButton = {
       let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = CGFloat.LayoutDimensions.margin * 2
        return button
    }()
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
    let addButton: NormalButton = {
        let button = NormalButton()
        button.setTitle("AddJigsaw.Add".localized, for: .normal)
        return button
    }()
    let cancelButton: SmallButton = {
       let button = SmallButton()
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        return button
    }()
    
    override func configureConstraints() {
        [imageView, addImageButton, piecesCountTextFiled, missingPiecenCountTextField, descriptionTextField, addButton, cancelButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        addConstraints([
            imageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: CGFloat.LayoutDimensions.margin),
            imageView.widthAnchor.constraint(equalTo: piecesCountTextFiled.widthAnchor),
            imageView.bottomAnchor.constraint(equalTo: piecesCountTextFiled.topAnchor, constant: -CGFloat.LayoutDimensions.margin),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addConstraints([
            addImageButton.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            addImageButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            addImageButton.heightAnchor.constraint(equalToConstant: CGFloat.LayoutDimensions.margin * 4),
            addImageButton.widthAnchor.constraint(equalTo: addImageButton.heightAnchor)
        ])
        addConstraints([
            piecesCountTextFiled.bottomAnchor.constraint(equalTo: missingPiecenCountTextField.topAnchor, constant: -CGFloat.LayoutDimensions.margin),
            piecesCountTextFiled.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addConstraints([
            missingPiecenCountTextField.bottomAnchor.constraint(equalTo: descriptionTextField.topAnchor, constant: -CGFloat.LayoutDimensions.margin),
            missingPiecenCountTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        addConstraints([
            descriptionTextField.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -CGFloat.LayoutDimensions.margin * 4),
            descriptionTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTextField.widthAnchor.constraint(equalTo: piecesCountTextFiled.widthAnchor),
            descriptionTextField.heightAnchor.constraint(equalTo: piecesCountTextFiled.heightAnchor)
        ])
        addConstraints([
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -CGFloat.LayoutDimensions.margin * 2)
        ])
        addConstraints([
            cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat.LayoutDimensions.margin),
            cancelButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: CGFloat.LayoutDimensions.margin)
        ])
    }
}
