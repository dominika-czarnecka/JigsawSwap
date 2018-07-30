import Foundation
import UIKit
import RxSwift
import RxCocoa
import FirebaseAuth

final class RegisterViewController: BaseViewController<RegisterView> {
    
    override func setupReactiveBinding() {
        customView.loginTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                guard let strongSelf = self else { return }
                strongSelf.customView.loginTextField.isValid() ? strongSelf.customView.loginTextField.animateIdentity() : strongSelf.customView.loginTextField.animateError()
            })
            .disposed(by: disposeBag)
        
        customView.repeatPasswordTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                guard let strongSelf = self else { return }
                strongSelf.customView.passwordTextField.isValid() ? strongSelf.customView.passwordTextField.animateIdentity() : strongSelf.customView.passwordTextField.animateError()
            })
            .disposed(by: disposeBag)
        
        customView.nameTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                guard let strongSelf = self else { return }
                strongSelf.customView.nameTextField.isValid() ? strongSelf.customView.nameTextField.animateIdentity() : strongSelf.customView.nameTextField.animateError()
            })
            .disposed(by: disposeBag)
        
        customView.surnameTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                guard let strongSelf = self else { return }
                strongSelf.customView.surnameTextField.isValid() ? strongSelf.customView.surnameTextField.animateIdentity() : strongSelf.customView.surnameTextField.animateError()
            })
            .disposed(by: disposeBag)
        
        customView.registerButton.rx.tap
            .subscribe(onNext: { [weak self] (_) in
                guard let storngSelf = self,
                    let login = storngSelf.customView.loginTextField.text,
                    !login.isEmpty,
                    let password = storngSelf.customView.passwordTextField.text,
                    !password.isEmpty,
                    storngSelf.customView.loginTextField.isValid(),
                    storngSelf.customView.passwordTextField.isValid() else {
                        print("Credencials not finished")
                        return
                }
                storngSelf.register(mail: login, password: password)
            })
            .disposed(by: disposeBag)
    }
    
    private func register(mail: String, password: String) {
        Auth.auth().createUser(withEmail: mail, password: password) { [weak self] (authResult, error) in
            guard error == nil else {
                let alert = UIAlertController(with: nil, title: "Error".localized, message: error?.localizedDescription)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            //TODO: Do something after register
        }
    }
}
