//
//  LoginViewController.swift
//  Mutfaktan
//
//  Created by Ömer  PENBEGÜL on 20.05.2025.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.shadowOpacity = 0.2
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.shadowOpacity = 0.2
    }
//giriş kontrolü
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        AuthViewModel.shared.login(email: emailTextField.text, password: passwordTextField.text) { success in
            if success {
                DispatchQueue.main.async {
                    // tabbara geçiş sağlanıyor.
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let tabbarVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
                    tabbarVC.modalPresentationStyle = .fullScreen
                    self.present(tabbarVC, animated: true)
                }
            } else {
                self.showAlert(message: "Giriş başarısız. Email veya şifre hatalı.")
            }
        }
    }
//kayıt ekranına gidiş
    @IBAction func goToSignup(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.present(signupVC, animated: true)
    }
//hatalı giriş için uyarı hata mesajı
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default))
        present(alert, animated: true)
    }
}
