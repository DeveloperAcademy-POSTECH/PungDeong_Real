//
//  Home-main.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/07.
//

import SwiftUI


struct Home_main: View {
    
    //Pop to root View 를 위한 navigation View is Active
    @State var isActive: Bool = false
    
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var count: UserDelete
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Image("characters")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width,
                               alignment: .center)
                        .padding()
                    
                    HeaderView()
                    
                    Spacer()
                    
                    if userInfo.email != nil {
                        NavigationLink(
                            destination: TestDescriptionContent(rootIsActive: $isActive).navigationBarHidden(true)
                            ,isActive: self.$isActive){
                                RetestButton()
                            }
                            .isDetailLink(false)
                            .navigationBarTitle("Home")
                    } else {
                        NavigationLink(
                            destination: LogInView(isPresented: $isActive)){
                                Text("로그인")
                                    .fontWeight(.bold)
                                    .frame(height: 50, alignment: .center)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(red: 0.455, green: 0.702, blue: 1.000, opacity: 1.0))
                                    .foregroundColor(Color.white)
                                    .cornerRadius(8)
                            }
                    }
            }
            .padding(.horizontal, 20)
            
            .toolbar {
                if userInfo.test != nil {
                    NavigationLink(
                        destination: ProfileView(userInfo: userInfo, count: count, shouldPopToRootView: $isActive),
                            label: {
                                ToolbarImage()
                            })
                    } else if userInfo.test == nil && userInfo.email == nil {
                        NavigationLink(
                            destination: LogInView(isPresented: $isActive),
                            label: {
                                ToolbarImage()
                            }
                        )
                    }
                }
                .navigationBarItems(leading: Image("심볼")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, alignment: .topLeading))
            }
        }
        .onAppear {
            
        }
    }
}

struct Home_main_Previews: PreviewProvider {
    static var previews: some View {
        Home_main()
    }
}
