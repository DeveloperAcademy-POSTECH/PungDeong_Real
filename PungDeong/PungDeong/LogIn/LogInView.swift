//
//  LogInView.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/06.
//

import SwiftUI

struct LogInView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack{
            Color("배경색1")
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                AppSymbol()
                
                Spacer()
                
                VStack{
                    AppleLogIn()
                    GoogleLogIn()
                }.padding()
            }
        }
    }
}
