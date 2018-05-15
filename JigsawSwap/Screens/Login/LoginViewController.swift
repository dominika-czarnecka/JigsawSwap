import UIKit
import RxCocoa
import RxSwift
import KeychainAccess
import FirebaseAuth

class LoginViewController: BaseViewController<LoginView> {
    
    override func bind() {
        
        aView.loginTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (_) in
                _ = self?.aView.loginTextField.validate()
            })
            .disposed(by: disposeBag)
        
        aView.passwordTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (_) in
               _ = self?.aView.passwordTextField.validate()
            })
            .disposed(by: disposeBag)
        
        aView.loginButton.rx.tap
            .subscribe(onNext: { [weak self] (_) in
                guard let login = self?.aView.loginTextField.text, !login.isEmpty,
                    let password = self?.aView.passwordTextField.text, !password.isEmpty,
                    self?.aView.loginTextField.validate() == true && self?.aView.passwordTextField.validate() == true else {
                        print("Credencials not finished")
                    return
                }
                self?.login(mail: login, password: password)
            })
            .disposed(by: disposeBag)
        
        aView.registerButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.pushViewController(RegisterViewController(), animated: true)
                })
            .disposed(by: disposeBag)
        
        aView.forgotPasswordButton.rx.tap
            .subscribe(onNext: { [weak self] in
                //TODO: Push forgot alert/controller
                })
        .disposed(by: disposeBag)
    }
    
    private func login(mail: String, password: String) {
        Auth.auth().signIn(withEmail: mail, password: password) { (user, error) in
            guard error != nil else {
                let alert = UIAlertController(withOkAction: nil, title: "Error".localized, message: error!.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
    }
}
