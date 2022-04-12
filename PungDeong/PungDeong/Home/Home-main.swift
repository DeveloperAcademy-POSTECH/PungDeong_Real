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
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Image("동물들")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width,
                               alignment: .center)
                        .padding()
                    
                    HeaderView()
                    
                    Spacer()
                    
                    
                    NavigationLink(
                        destination:
                            
                            TestDescriptionContent(rootIsActive: $isActive)
                            .navigationBarHidden(true)
                            ,
                            isActive: self.$isActive
                        ) {
                            RetestButton()
                                
                        }
                        .isDetailLink(false)
                        .navigationBarTitle("Home")
                    
                    
                    
                  
                    
                    
                    
                }
                .padding(.horizontal, 20)
                
                .toolbar {
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            ToolbarImage()
                        })
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
