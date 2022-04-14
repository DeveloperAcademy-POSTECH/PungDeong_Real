//
//  TestLogin.swift
//  PungDeong
//
//  Created by woo0 on 2022/04/14.
//

import SwiftUI

struct TestLogin: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @EnvironmentObject var userInfo: UserInfo
    @Binding var isPresented: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(action: {
            userInfo.email = "Test"
            FirebaseDB().setUserInfo(email: "Test", userInfo: userInfo)
            isPresented.toggle()
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack(alignment: .center, spacing: 4) {
                Text("Sign in with Test")
                    .font(.custom("Roboto-Medium", fixedSize: 16))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.54))
            }
        })
        .frame(width: screenWidth * 0.8, height: 44)
        .background(Color.white)
        .cornerRadius(8.0)
        .shadow(radius: 4.0)
    }
}
