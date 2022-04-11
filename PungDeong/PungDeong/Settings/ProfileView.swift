//
//  ProfileView.swift
//  PungDeong
//
//  Created by woo0 on 2022/04/11.
//

import SwiftUI

struct ProfileView: View {
    @State var profileInfo = ["안경 쓴 물개","아직 뭐하는 애인지 잘 모름."]
    @State var testResult = ["테스트 결과: ","시뮬레이션 게임 결과: "]
    @State private var showDetails = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Image("sample")
                        .resizable()
                        .frame(width: geometry.size.width*0.5, height: geometry.size.width*0.5)
                    Text("#!@$!#$한 !@$!$@$이에요.")
                }
                .padding([.top, .bottom], geometry.size.height*0.05)
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
                        Text("\(profileInfo[0])")
                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                            .padding([.leading])
                        Text("\(profileInfo[1])")
                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                            .padding([.leading])
                    }
                }
                VStack {
                    VStack {
                        Text("지난 결과 모아보기")
                            .foregroundColor(Color("CustomGray"))
                            .font(.system(size: 25, weight: .bold))
                            .frame(width: geometry.size.width, height: geometry.size.height*0.07, alignment: .leading)
                            .padding([.leading])
                    }
                    //.frame(width: geometry.size.width, height: 50)
                    .background(Color("VeryLightBlue"))
                    VStack {
                        Text("\(testResult[0])")
                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                            .padding([.leading])
                        Text("\(testResult[1])")
                            .frame(width: geometry.size.width, height: geometry.size.height*0.05, alignment: .leading)
                            .padding([.leading])
                    }
                }
                .padding([.bottom], geometry.size.height*0.03)
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
