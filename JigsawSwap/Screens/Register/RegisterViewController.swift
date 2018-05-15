import Foundation
import UIKit
import RxSwift
import RxCocoa
import FirebaseAuth

class RegisterViewController: BaseViewController<RegisterView> {
    
    override func bind() {
        
        aView.loginTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.aView.loginTextField.validate()
            })
            .disposed(by: disposeBag)
        
        aView.repeatPasswordTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                if text == self?.aView.passwordTextField.text {
                    self?.aView.repeatPasswordTextField.showErrorMessage(false)
                } else {
                    self?.aView.repeatPasswordTextField.showErrorMessage(true)
                }
            })
            .disposed(by: disposeBag)
        
        aView.nameTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.aView.nameTextField.validate()
            })
            .disposed(by: disposeBag)
        
        aView.surnameTextField.rx.text
            .changed
            .subscribe(onNext: { [weak self] (text) in
                _ = self?.aView.surnameTextField.validate()
            })
            .disposed(by: disposeBag)
        
        aView.registerButton.rx.tap
            .subscribe(onNext: { [weak self] (_) in
                guard let login = self?.aView.loginTextField.text, !login.isEmpty,
                    let password = self?.aView.passwordTextField.text, !password.isEmpty,
                    self?.aView.loginTextField.validate() == true && self?.aView.passwordTextField.validate() == true else {
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
