import UIKit

final class RegisterView: BaseView {

    let loginTextField = ValidationTextField(.mail)
    let passwordTextField = ValidationTextField(.password)
    let repeatPasswordTextField = ValidationTextField(.password)
    let nameTextField = ValidationTextField(.name)
    let surnameTextField = ValidationTextField(.surname)
    let birthDayPickerView = UIDatePicker()
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register.RegistrationButton.Title".localized, for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    override init() {
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(repeatPasswordTextField)
        addSubview(nameTextField)
        addSubview(surnameTextField)
        addSubview(registerButton)
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            repeatPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 50),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            surnameTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 50),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
