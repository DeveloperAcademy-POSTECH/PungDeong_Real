//
//  GoogleLogIn.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/07.
//


import SwiftUI
import GoogleSignIn

// 구글 로그인 디자인 가이드 : https://developers.google.com/identity/branding-guidelines?hl=ko
struct GoogleLogIn: View {
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var vm: GoogleUserAuthModel
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
        
    var body: some View {
        Button(action: {vm.signIn { email in
            userInfo.email = email
            FirebaseDB().setUserInfo(email: email, userInfo: userInfo)
        }}, label: {
            HStack(alignment: .center, spacing: 24) {
                Image("Google")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Text("Google 계정으로 로그인")
                    .font(.custom("Roboto-Medium", fixedSize: 14))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.54))
            }
        })
        .frame(width: screenWidth * 0.8, height: 44)
        .background(Color.white)
        .cornerRadius(8.0)
        .shadow(radius: 4.0)
        //.padding(EdgeInsets(top: 8, leading: 11, bottom: 8, trailing: 11))
    }
}
