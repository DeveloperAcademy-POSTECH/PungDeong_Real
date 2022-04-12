//
//  ProfileView.swift
//  PungDeong
//
//  Created by woo0 on 2022/04/11.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

func resultType(_ type: Int) -> resultData {
    var result: resultData
    switch type {
    case 1:
        result = resultData(type: "1", name: "프로 팩트체커 교직원 우파루파", hastag: ["#우파루파", "#펙트체커"], description: "당신은 팩트체크가 생활화된 우파루파!", image: "sample")
    case 2:
        result = resultData(type: "2", name: "박학다식 대학원생 해달", hastag: ["해시태그1", "해시태그2"], description: "당신은 전문 지식을 중시하는 해달이에요! 사실 여부가 확실하지 않은 정보를 접하면 그냥 받아들이기 보다는 전문가의 조언을 구하는 당신의 모습이 마치 박학다식한 대학원생 같군요.", image: "sample")
    case 3:
        result = resultData(type: "3", name: "꼼꼼한 과대표 금붕어", hastag: ["해시태그1", "해시태그2"], description: "당신은 꼼꼼하고 신중한 금붕어!", image: "sample")
    case 4:
        result = resultData(type: "4", name: "논리적인 수험생 돌고래", hastag: ["해시태그1", "해시태그2"], description: "논리가 중요한 당신! 논리주의자 돌고래예요.", image: "sample")
    case 5:
        result = resultData(type: "5", name: "중립기어 마을이장 거북이", hastag: ["해시태그1", "해시태그2"], description: "중립이 중요한 당신! 중립기어를 넣는 중재자 거북이예요.", image: "sample")
    default:
        result = resultData(type: "", name: "", hastag: [""], description: "", image: "")
    }
    return result
}

struct ProfileView: View {
    @StateObject var googleUserAuth: GoogleUserAuthModel =  GoogleUserAuthModel()
    
    var viewModel = TestResultViewModel()
    
    var userInfo = UserInfo()
    private let db = Firestore.firestore()
    @State private var isPresented = true
    @State var profileInfo = ["안경 쓴 물개","아직 뭐하는 애인지 잘 모름."]
    @State var testResult = ["테스트 결과: ","시뮬레이션 게임 결과: "]
    @State private var showDetails = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Image(resultType(1).image)
                        .resizable()
                        .frame(width: geometry.size.width*0.5, height: geometry.size.width*0.5)
                    Text("\(resultType(1).name)")
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
                        Text("\(resultType(1).hastag[0]) \(resultType(1).hastag[1])")
                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                            .padding([.leading])
                        Text("\(resultType(1).name)")
                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                            .padding([.leading])
                        Text("\(resultType(1).description)")
                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                            .padding([.leading])
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
                        
                    }, label: {
                        Text("테스트 결과 다시보기")
                    })
                    .buttonStyle(SettingButtonStyle())
                    Button(action: {
                        
                    }, label: {
                        Text("로그아웃")
                    })
                    .buttonStyle(SettingButtonStyle())
                    Button(action: {
//                        db.collection("Email").document("dongho9732@gmail.com").delete() { err in
//                            if let err = err {
//                                print("Error removing document: \(err)")
//                            } else {
//                                print("Document successfully removed!")
//                            }
//                        }
                        
                    }, label: {
                        Text("회원탈퇴")
                    })
                    .buttonStyle(SettingButtonStyle())
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct SettingButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 150, height: 45)
            .font(.system(size: 14))
            .foregroundColor(Color.white)
            .background(Color("LightBlue"))
            .cornerRadius(6.0)
    }
}
