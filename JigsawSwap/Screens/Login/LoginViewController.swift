import UIKit
import RxCocoa
import RxSwift
import FirebaseAuth

final class LoginViewController: BaseViewController<LoginView> {
    
    override func setupReactiveBinding() {
        //TODO: Add debounce to all textFields
        customView.loginTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (_) in
                guard let strongSelf = self else { return }
                strongSelf.customView.loginTextField.isValid() ? strongSelf.customView.loginTextField.animateIdentity() : strongSelf.customView.loginTextField.animateError()
            })
            .disposed(by: disposeBag)
        
        //TODO: Maybe handle pressing enter to go to next field. Check if KeyboardManager doesn't handle that.
        customView.passwordTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (_) in
                guard let strongSelf = self else { return }
                strongSelf.customView.passwordTextField.isValid() ? strongSelf.customView.passwordTextField.animateIdentity() : strongSelf.customView.passwordTextField.animateError()
            })
            .disposed(by: disposeBag)
        
        customView.loginButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let strongSelf = self,
                    let login = strongSelf.customView.loginTextField.text,
                    !login.isEmpty,
                    let password = strongSelf.customView.passwordTextField.text,
                    !password.isEmpty,
                    strongSelf.customView.loginTextField.isValid() &&
                        strongSelf.customView.passwordTextField.isValid() else {
                            return
                }
                strongSelf.login(mail: login, password: password)
            })
            .disposed(by: disposeBag)
        
        customView.registerButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.pushViewController(RegisterViewController(), animated: true)
            })
            .disposed(by: disposeBag)
        
        customView.forgotPasswordButton.rx.tap
            .subscribe(onNext: { [weak self] in
                //TODO: Push forgot alert/controller
            })
            .disposed(by: disposeBag)
    }
    
    private func login(mail: String, password: String) {
        Auth.auth().signIn(withEmail: mail, password: password) { [weak self] (user, error) in
            guard error != nil else {
                let alert = UIAlertController(with: nil, title: "Error".localized, message: error!.localizedDescription)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            //TODO: handle login
        }
    }
}
