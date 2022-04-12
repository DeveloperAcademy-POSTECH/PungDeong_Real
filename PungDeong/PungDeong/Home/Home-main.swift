//
//  Home-main.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/07.
//

import SwiftUI


struct Home_main: View {
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
                    
                    
                    
                    
                    NavigationLink(
                        destination: {
                            TestView()
                                .navigationBarHidden(true)
                        },
                        label: {
                            RetestButton()
                        })
                    
                    Spacer()
                    
                }
                .padding()
                .toolbar {
                    NavigationLink(
                        destination: Text("Profile"),
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
