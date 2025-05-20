//
//  LoginViewController.swift
//  Mutfaktan
//
//  Created by Ömer  PENBEGÜL on 20.05.2025.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // textfield ve button özelleştirme
    func setupUI() {
        [emailTextField, passwordTextField].forEach { textField in
            textField?.layer.cornerRadius = 8
            textField?.layer.shadowColor = UIColor.black.cgColor
            textField?.layer.shadowOpacity = 0.2
            textField?.layer.shadowOffset = CGSize(width: 0, height: 2)
            textField?.layer.shadowRadius = 4
           // textField?.layer.borderWidth = 1
           // textField?.layer.borderColor = UIColor.lightGray.cgColor
            textField?.clipsToBounds = false
        }
        
        loginButton.layer.cornerRadius = 8
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOpacity = 0.2
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        loginButton.layer.shadowRadius = 4
        
        signupButton.layer.cornerRadius = 8
        signupButton.layer.shadowColor = UIColor.black.cgColor
        signupButton.layer.shadowOpacity = 0.2
        signupButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        signupButton.layer.shadowRadius = 4
        
    }

    // giriş kontrolü
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Lütfen tüm alanları doldurun.")
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.showAlert(message: error.localizedDescription)
            } else {
                // başarılı giriş
                self?.goToMainApp()
            }
        }
    }

    @IBAction func signupTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let signupVC = storyboard.instantiateViewController(withIdentifier: "SignupVC") as? SignupViewController {
            self.present(signupVC, animated: true, completion: nil)
        }
    }

    // uyarı hata mesajı
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default))
        present(alert, animated: true)
    }

    func goToMainApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {
            tabBarVC.modalPresentationStyle = .fullScreen
            self.present(tabBarVC, animated: true)
        }
    }
}
