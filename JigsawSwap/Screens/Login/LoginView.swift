import UIKit

final class LoginView: BaseView {

    let loginTextField = ValidationTextField(.mail)
    let passwordTextField = ValidationTextField(.password)
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login.LoginButton.Title".localized, for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    let registerButton: UIButton = {let button = UIButton()
        button.setTitle("Login.RegistrationButton.Title".localized, for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login.ForgotPasswordButton.Title".localized, for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    //TODO: Setup constraints
    override func configureConstraints() {
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
        addSubview(forgotPasswordButton)
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 50),
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
