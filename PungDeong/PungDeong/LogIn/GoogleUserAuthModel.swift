//
//  GoogleUserAuthModel.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/07.
//

import SwiftUI
import GoogleSignIn

class GoogleUserAuthModel: ObservableObject {
    @Published var email: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    init(){
        check()
    }

    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            
            self.checkStatus()
        }
    }
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let email = user.profile?.email
            self.email = email ?? ""
            self.isLoggedIn = true
        }else{
            self.isLoggedIn = false
        }
    }
    
    func signIn(completion: @escaping (String)->Void) {
        
       guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}

        let signInConfig = GIDConfiguration.init(clientID: "491328426201-fbambc7aid45apqegeoc21lmg0b2tsuj.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController,
            callback: { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.checkStatus()
            }
        )
        FirebaseDB().addEmail(email: email)
        completion(email)
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}
