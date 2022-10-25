//
//  AuthViewModel.swift
//  Timer
//
//  Created by Степан Величко on 18.10.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    
    init () {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User sesion is \(self.userSession?.uid)")
    }

    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did log user in")
        }
        
    }
    
    func register(withEmail email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            //self.userSession = user
            
            
            let data = ["email": email.lowercased(),
                        "name": name,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    //print("DEBUG: Did upload user data")
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        //Sign out user on the frontend
        userSession = nil
        
        //Sign out user on the backend/server
        try? Auth.auth().signOut()
    }
}
