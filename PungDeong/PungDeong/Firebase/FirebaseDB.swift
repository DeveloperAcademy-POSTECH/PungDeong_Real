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
        userInfo.test = fetchTest(email: email)
        userInfo.content1 = fetchContent1(email: email)
        userInfo.content2 = fetchContent2(email: email)
    }
    
    func fetchTest(email: String) -> Test? {
        var returnData: Test? = nil
        let docRef = db.collection("Test").document(email.description)

        docRef.getDocument(as: Test.self) { result in
            switch result {
            case .success(let test):
                returnData = test
            case .failure(let error):
                print("Error decoding: \(error)")
            }
        }
        
        return returnData
    }
    
    func fetchContent1(email: String) -> Content1? {
        var returnData: Content1? = nil
        let docRef = db.collection("Content1").document(email.description)

        docRef.getDocument(as: Content1.self) { result in
            switch result {
            case .success(let content1):
                
                returnData = content1
            case .failure(let error):
                print("Error decoding: \(error)")
            }
        }
        
        return returnData
    }
    
    func fetchContent2(email: String) -> Content2? {
        var returnData: Content2? = nil
        let docRef = db.collection("Content2").document(email.description)

        docRef.getDocument(as: Content2.self) { result in
            switch result {
            case .success(let content2):
                
                returnData = content2
            case .failure(let error):
                print("Error decoding: \(error)")
            }
        }
        
        return returnData
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
    
    func addTest(email: String, test: Test) {
        do {
            try db.collection("Test").document(email.description).setData(from: test)
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
