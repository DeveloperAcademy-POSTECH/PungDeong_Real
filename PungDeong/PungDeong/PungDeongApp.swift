//
//  PungDeongApp.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/11.
//

import SwiftUI
import Firebase
import KakaoSDKCommon

@main
struct PungDeongApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var googleUserAuth: GoogleUserAuthModel =  GoogleUserAuthModel()
    var userInfo = UserInfo()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {

            
            Home_main()
                .environmentObject(googleUserAuth)
                .environmentObject(userInfo)
        }
    }
}

//MARK: - AppDelegate SwiftUI 지원 안되는 라이브러리 사용을 위해 선언
class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {

        KakaoSDK.initSDK(appKey: "d279a8725a4a2fcccbfcb999e0f80e14")

        return true
    }
}
