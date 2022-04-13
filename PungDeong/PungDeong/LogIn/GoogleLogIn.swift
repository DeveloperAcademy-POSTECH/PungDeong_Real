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
    @Binding var isPresented: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
        
    var body: some View {
        Button(action: {vm.signIn { email in
            userInfo.email = email
            FirebaseDB().setUserInfo(email: email, userInfo: userInfo)
            isPresented.toggle()
            self.presentationMode.wrappedValue.dismiss()
        }}, label: {
            HStack(alignment: .center, spacing: 4) {
                Image("google")
                    .resizable()
                    .frame(width: 14, height: 14)
                
                Text("Sign in with Google")
                    .font(.custom("Roboto-Medium", fixedSize: 16))
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
