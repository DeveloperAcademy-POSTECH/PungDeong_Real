//
//  FirebaseDB.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/10.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FirebaseDB {
    
    private let db = Firestore.firestore()
    
    func setUserInfo(email: String, userInfo: UserInfo) {
        print("setUserInfo")
        fetchTest(email: email)
        fetchContent1(email: email)
        fetchContent2(email: email)
        
        func fetchTest(email: String) {
            let docRef = db.collection("Test1").document(email.description)

            docRef.getDocument(as: Test1.self) { result in
                switch result {
                case .success(let test):
                    userInfo.test = test
                case .failure(let error):
                    print("Error decoding: \(error)")
                }
            }
        }
        
        func fetchContent1(email: String) {
            let docRef = db.collection("Content1").document(email.description)

            docRef.getDocument(as: Content1.self) { result in
                switch result {
                case .success(let content1):
                    userInfo.content1 = content1
                case .failure(let error):
                    print("Error decoding: \(error)")
                }
            }
            
        }
        
        func fetchContent2(email: String) {
            let docRef = db.collection("Content2").document(email.description)

            docRef.getDocument(as: Content2.self) { result in
                switch result {
                case .success(let content2):
                    userInfo.content2 = content2
                case .failure(let error):
                    print("Error decoding: \(error)")
                }
            }
        }
    }
    
    func addEmail(email: String) {
        db.collection("Email").document(email.description).setData([
            "email": "\(email)",
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func addTest(email: String, test: Test1) {
        do {
            try db.collection("Test1").document(email.description).setData(from: test)
        } catch let error {
            print("Error writing: \(error)")
        }
    }
    
    func addContent1(email: String, content1: Content1) {
        do {
            try db.collection("Content1").document(email.description).setData(from: content1)
        } catch let error {
            print("Error writing: \(error)")
        }
    }
    
    func addContent2(email: String, content2: Content2) {
        do {
            try db.collection("Content2").document(email.description).setData(from: content2)
        } catch let error {
            print("Error writing: \(error)")
        }
    }
}
