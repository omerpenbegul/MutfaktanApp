//
//  AuthViewModel.swift
//  Mutfaktan
//
//  Created by Ömer  PENBEGÜL on 20.05.2025.
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    static let shared = AuthViewModel()
// firebase bağalantısı, kullanıcı giriş ve oluşturma
    // firebase login
    func login(email: String?, password: String?, completion: @escaping (Bool) -> Void) {
        guard let email = email, let password = password else {
            completion(false)
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completion(error == nil)
        }
    }
// firebase yeni kullanıcı oluşturma
    func signup(email: String?, password: String?, completion: @escaping (Bool) -> Void) {
        guard let email = email, let password = password else {
            completion(false)
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            completion(error == nil)
        }
    }
}
