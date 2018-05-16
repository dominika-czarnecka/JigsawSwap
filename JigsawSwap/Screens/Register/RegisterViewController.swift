import Foundation
import UIKit
import RxSwift
import RxCocoa
import FirebaseAuth

final class RegisterViewController: BaseViewController<RegisterView> {
    
    override func setupRx() {
        customView.loginTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.customView.loginTextField.isValid()
            })
            .disposed(by: disposeBag)
        
        customView.repeatPasswordTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                if text == self?.customView.passwordTextField.text {
                    self?.customView.repeatPasswordTextField.showErrorMessage(false)
                } else {
                    self?.customView.repeatPasswordTextField.showErrorMessage(true)
                }
            })
            .disposed(by: disposeBag)
        
        customView.nameTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.customView.nameTextField.isValid()
            })
            .disposed(by: disposeBag)
        
        customView.surnameTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.customView.surnameTextField.isValid()
            })
            .disposed(by: disposeBag)
        
        customView.registerButton.rx.tap
            .subscribe(onNext: { [weak self] (_) in
                guard let login = self?.customView.loginTextField.text, !login.isEmpty,
                    let password = self?.customView.passwordTextField.text, !password.isEmpty,
                    self?.customView.loginTextField.isValid() == true && self?.customView.passwordTextField.isValid() == true else {
                        print("Credencials not finished")
                        return
                }
                self?.register(mail: login, password: password)
            })
            .disposed(by: disposeBag)
    }
    
    private func register(mail: String, password: String) {
        Auth.auth().createUser(withEmail: mail, password: password) { [weak self] (authResult, error) in
            guard error == nil else {
                let alert = UIAlertController(withOkAction: nil, title: "Error".localized, message: error?.localizedDescription)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            print(authResult)
            //TODO: Do something after register
            
        }
    }
}
