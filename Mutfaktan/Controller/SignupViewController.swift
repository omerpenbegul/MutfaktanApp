//
//  SignupViewController.swift
//  Mutfaktan
//
//  Created by Ömer  PENBEGÜL on 20.05.2025.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func signupTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Lütfen tüm alanları doldurun.")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.showAlert(message: "Kayıt Hatası: \(error.localizedDescription)")
            } else {
                self.showAlert(message: "Kayıt başarılı!", completion: {
                    self.dismiss(animated: true)
                })
            }
        }
    }

    private func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Bilgi", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
            completion?()
        }))
        present(alert, animated: true)
    }

    private func setupUI() {
        signupButton.layer.cornerRadius = 10
        signupButton.layer.shadowColor = UIColor.black.cgColor
        signupButton.layer.shadowOpacity = 0.2
        signupButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        signupButton.layer.shadowRadius = 4
    }
}
