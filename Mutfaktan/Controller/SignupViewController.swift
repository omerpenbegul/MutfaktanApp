//
//  SignupViewController.swift
//  Mutfaktan
//
//  Created by Ömer  PENBEGÜL on 20.05.2025.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.shadowOpacity = 0.2
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.shadowOpacity = 0.2
    }
//kayıt kontrolü
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        AuthViewModel.shared.signup(email: emailTextField.text, password: passwordTextField.text) { success in
            if success {
                self.showAlertAndReturn(message: "Kayıt başarılı. Giriş ekranına yönlendiriliyorsunuz.")
            } else {
                self.showAlert(message: "Kayıt başarısız. Lütfen tekrar deneyin.")
            }
        }
    }
//başarılı kayıt mesajı
    func showAlertAndReturn(message: String) {
        let alert = UIAlertController(title: "Başarılı", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default) { _ in
            self.dismiss(animated: true)
        })
        present(alert, animated: true)
    }
//hatalı kayıt işlemi mesaji
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Hata", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default))
        present(alert, animated: true)
    }
}
