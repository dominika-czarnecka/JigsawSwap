import UIKit

final class RegisterView: BaseView {

    let loginTextField = ValidationTextField(.mail)
    let passwordTextField = ValidationTextField(.password)
    let repeatPasswordTextField = ValidationTextField(.password)
    let nameTextField = ValidationTextField(.name)
    let surnameTextField = ValidationTextField(.surname)
    let birthDayPickerView = UIDatePicker()
    let registerButton: NormalButton = {
        let button = NormalButton()
        button.setTitle("Register.RegistrationButton.Title".localized, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureConstraints() {
        [loginTextField, passwordTextField, repeatPasswordTextField, nameTextField, registerButton, surnameTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: CGFloat.LayoutDimensions.margin * 2),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: CGFloat.LayoutDimensions.margin * 2),
            repeatPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: CGFloat.LayoutDimensions.margin * 2),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: CGFloat.LayoutDimensions.margin * 2),
            surnameTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            registerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -CGFloat.LayoutDimensions.margin * 2),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
