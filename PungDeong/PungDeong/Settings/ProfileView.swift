//
//  ProfileView.swift
//  PungDeong
//
//  Created by woo0 on 2022/04/11.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct ProfileView: View {
    var viewModel = TestResultViewModel()
    var userInfo: UserInfo
    var count: UserDelete
    var data: resultData {
        return viewModel.resultType(userInfo.test?.type ?? 0)
    }
    private let db = Firestore.firestore()
    @Binding var shouldPopToRootView: Bool
    @State var isFinished: Bool = true
    @State private var isPresented = false
    @StateObject var googleUserAuth: GoogleUserAuthModel =  GoogleUserAuthModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    VStack {
                        Image(data.image)
                            .resizable()
                            .frame(width: geometry.size.width*0.5-10, height: geometry.size.width*0.5)
                        Text("\(data.name)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("character_\(userInfo.test?.type ?? 0)"))
                            .padding([.trailing], 10)
                            .padding([.bottom], 30)
                    }
                    VStack {
                        VStack {
                            Text("프로필")
                                .foregroundColor(Color("CustomGray"))
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                                .padding([.leading])
                        }
                        //.frame(width: geometry.size.width, height: 50)
                        .background(Color("VeryLightBlue"))
                        VStack {
//                            Text("#\(data.hastag[0]) #\(data.hastag[1])")
//                                .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
//                                .padding([.leading])
                            Text("\(data.name)")
                                .frame(width: geometry.size.width-40, height: geometry.size.height*0.05, alignment: .leading)
                                .padding([.leading, .trailing], 15)
                            Text("\(data.description)")
                                .frame(width: geometry.size.width-40, alignment: .leading)
                                .padding([.leading, .trailing], 15)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
    //                VStack {
    //                    VStack {
    //                        Text("지난 결과 모아보기")
    //                            .foregroundColor(Color("CustomGray"))
    //                            .font(.system(size: 25, weight: .bold))
    //                            .frame(width: geometry.size.width, height: geometry.size.height*0.07, alignment: .leading)
    //                            .padding([.leading])
    //                    }
    //                    //.frame(width: geometry.size.width, height: 50)
    //                    .background(Color("VeryLightBlue"))
    //                    VStack {
    //                        Text("\(resultType(1).name)")
    //                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
    //                            .padding([.leading])
    //                        Text("\(resultType(1).description)")
    //                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
    //                            .padding([.leading])
    //                    }
    //                }
    //                .padding([.bottom], geometry.size.height*0.03)
                    VStack(spacing: 10) {
                        Button(action: {
                        }) {
                            NavigationLink(destination: TestResultReview(userInfo: userInfo)) {
                                Text("테스트 결과 다시보기")
                            }
                        }
                        .buttonStyle(SettingButtonStyle())
                        .padding([.leading], -15)

                        
                        Button(action: {
                            userInfo.email = nil
                            userInfo.test = nil
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("로그아웃")
                        })
                        .buttonStyle(SettingButtonStyle())
                        .padding([.leading], -15)
                        
                        Button(action: {
                            db.collection("Email").document("\(userInfo.email ?? "")").delete() { err in
                                if let err = err {
                                    print("Error removing document: \(err)")
                                } else {
                                    print("Document successfully removed!")
                                }
                            }
                            db.collection("Test1").document("\(userInfo.email ?? "")").delete() {
                                err in
                                if let err = err {
                                    print("Error removing document: \(err)")
                                } else {
                                    print("Document successfully removed!")
                                }
                            }
                            userInfo.email = nil
                            userInfo.test = nil
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("회원탈퇴")
                        })
                        .buttonStyle(SettingButtonStyle())
                        .padding([.leading], -15)
                        
                        

                    }
                }
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userInfo: UserInfo(), count: UserDelete(count: false), shouldPopToRootView: .constant(true))
    }
}

struct SettingButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color.white)
            .background(Color("LightBlue"))
            .cornerRadius(6)
            .padding(.horizontal, 30)
    }
}

