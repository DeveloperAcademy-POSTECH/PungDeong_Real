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
                            .frame(width: geometry.size.width*0.5, height: geometry.size.width*0.5)
                        Text("\(data.name)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("character_\(userInfo.test?.type ?? 0)"))
                    }
                    VStack {
                        VStack {
                            Text("프로필")
                                .foregroundColor(Color("CustomGray"))
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: geometry.size.width, height: geometry.size.height*0.07, alignment: .leading)
                                .padding([.leading])
                        }
                        //.frame(width: geometry.size.width, height: 50)
                        .background(Color("VeryLightBlue"))
                        VStack {
//                            Text("#\(data.hastag[0]) #\(data.hastag[1])")
//                                .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
//                                .padding([.leading])
                            Text("\(data.name)")
                                .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                                .padding([.leading])
                            Text("\(data.description)")
                                .frame(width: geometry.size.width, alignment: .leading)
                                .padding([.leading])
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
                    VStack {
                        Button(action: {
                        }) {
                            NavigationLink(destination: TestResultReview(userInfo: userInfo)) {
                                Text("테스트 결과 다시보기")
                            }
                        }
                        .buttonStyle(SettingButtonStyle())
//                        Button(action: {
//                        }) {
////                            NavigationLink(destination: Home_main()) {
////                                Text("로그아웃")
////                            }
//                            NavigationLink(destination: Home_main()
//                                .navigationBarHidden(true)
//                            ) {
//                                Text("로그아웃")
//                            }
//                        }
                        Button(action: {
                            userInfo.email = nil
                            userInfo.test = nil
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("로그아웃")
                        })
                        .buttonStyle(SettingButtonStyle())
                        
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
                        
                        
//                        .toolbar {
//                            if count.count == false {
//                                NavigationLink(destination: Home_main()
//                                    .navigationBarHidden(true)
//                                    .onAppear(perform: {
//                                        db.collection("Email").document("\(userInfo.email ?? "")").delete() { err in
//                                            if let err = err {
//                                                print("Error removing document: \(err)")
//                                            } else {
//                                                print("Document successfully removed!")
//                                            }
//                                        }
//                                        db.collection("Test1").document("\(userInfo.email ?? "")").delete() {
//                                            err in
//                                            if let err = err {
//                                                print("Error removing document: \(err)")
//                                            } else {
//                                                print("Document successfully removed!")
//                                            }
//                                        }
//                                        userInfo.email = nil
//                                        userInfo.test = nil
//                                        count.count = true
//                                        //self.presentationMode.wrappedValue.dismiss()
//                                    })
//                                ) {
//                                    Image(systemName: "person.fill.xmark")
//                                }
//                            }
//                        }
//                        .navigationBarItems(leading: Image("심볼")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 45, alignment: .topLeading))
                    }
                }
            }
        }
    }
}

//Button(action: {
//}) {
////                            NavigationLink(destination: Home_main()) {
////                                Text("로그아웃")
////                            }
//    NavigationLink(destination: Home_main()
//        .navigationBarHidden(true)
//        .onAppear(perform: {
//            db.collection("Email").document("\(userInfo.email ?? "")").delete() { err in
//                if let err = err {
//                    print("Error removing document: \(err)")
//                } else {
//                    print("Document successfully removed!")
//                }
//            }
//            db.collection("Test1").document("\(userInfo.email ?? "")").delete() {
//                err in
//                if let err = err {
//                    print("Error removing document: \(err)")
//                } else {
//                    print("Document successfully removed!")
//                }
//            }
//            userInfo.email = nil
//            userInfo.test = nil
//            //self.presentationMode.wrappedValue.dismiss()
//        })
//    ) {
//        Text("회원탈퇴")
//    }
//}
//.buttonStyle(SettingButtonStyle())

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
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(Color.white)
            .background(Color("LightBlue"))
            .cornerRadius(6)
            .padding(.horizontal, 20)
    }
}
