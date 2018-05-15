import UIKit

class LoginView: BaseView {

    let loginTextField = ValidationTextField(.mail)
    let passwordTextField = ValidationTextField(.password)
    let loginButton = UIButton()
    let registerButton = UIButton()
    let forgotPasswordButton = UIButton()
    
    override func configureSubviews() {
        super.configureSubviews()
        
        addSubview(loginTextField)
        addSubview(passwordTextField)
        
        loginButton.setTitle("Login.LoginButton.Title".localized, for: .normal)
        loginButton.backgroundColor = .gray
        addSubview(loginButton)
        
        registerButton.setTitle("Login.RegistrationButton.Title".localized, for: .normal)
        registerButton.backgroundColor = .gray
        addSubview(registerButton)
        
        forgotPasswordButton.setTitle("Login.ForgotPasswordButton.Title".localized, for: .normal)
        forgotPasswordButton.backgroundColor = .gray
        addSubview(forgotPasswordButton)
    }
    
    //TODO: Setup constraints
    override func configureConstraints() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            loginTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 50),
            passwordTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 50),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
