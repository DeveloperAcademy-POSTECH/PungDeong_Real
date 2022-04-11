//
//  PungDeongApp.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/11.
//

import SwiftUI
import Firebase

@main
struct PungDeongApp: App {
    
    @StateObject var googleUserAuth: GoogleUserAuthModel =  GoogleUserAuthModel()
    var userInfo = UserInfo()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(googleUserAuth)
                .environmentObject(userInfo)
        }
    }
}
