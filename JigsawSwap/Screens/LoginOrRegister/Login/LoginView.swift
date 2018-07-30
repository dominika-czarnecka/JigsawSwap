import UIKit

final class LoginView: BaseView {
    let loginTextField = ValidationTextField(.mail)
    let passwordTextField = ValidationTextField(.password)
    
    let loginButton: NormalButton = {
        let button = NormalButton()
        button.setTitle("Login.LoginButton.Title".localized, for: .normal)
        return button
    }()
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login.RegistrationButton.Title".localized, for: .normal)
        return button
    }()
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login.ForgotPasswordButton.Title".localized, for: .normal)
        button.titleLabel?.font = UIFont().appFont(fontSize: 12)
        return button
    }()
    
    override func configureConstraints() {
        [loginTextField, passwordTextField, loginButton, registerButton, forgotPasswordButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -CGFloat.LayoutDimensions.margin * 2),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat.LayoutDimensions.margin),
            registerButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -CGFloat.LayoutDimensions.margin)
        ])
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2),
            forgotPasswordButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor)
        ])
    }
}
