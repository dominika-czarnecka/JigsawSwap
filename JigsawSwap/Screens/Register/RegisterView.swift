import UIKit

class RegisterView: BaseView {

    let loginTextField = ValidationTextField(.mail)
    let passwordTextField = ValidationTextField(.password)
    let repeatPasswordTextField = ValidationTextField(.password)
    let nameTextField = ValidationTextField(.name)
    let surnameTextField = ValidationTextField(.surname)
    let birthDayPickerView = UIDatePicker()
    let registerButton = UIButton()
    
    override init() {
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureSubviews() {
        super.configureSubviews()
        
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(repeatPasswordTextField)
        addSubview(nameTextField)
        addSubview(surnameTextField)
        
        registerButton.setTitle("Register.RegistrationButton.Title".localized, for: .normal)
        registerButton.backgroundColor = .gray
        addSubview(registerButton)
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            loginTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 50),
            passwordTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            repeatPasswordTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            repeatPasswordTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 50),
            nameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            surnameTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            surnameTextField.heightAnchor.constraint(equalToConstant: 40),
            surnameTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 50),
            registerButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
