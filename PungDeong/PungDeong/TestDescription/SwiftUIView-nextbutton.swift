//
//  SwiftUIView-nextbutton.swift
//  PungDeong
//
//  Created by 전호정 on 2022/04/08.
//

import SwiftUI

struct StackView: View {
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
    
            VStack {
                HStack {
                    Text("환영해요!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        
                    
                    Spacer()
                }
                .padding(.leading, 30)
                
                Image("seal")
                    //테스트 관련 설명 이미지 자리
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                
                NavigationLink {
                    
                    TestView(rootIsActive: $rootIsActive)
                     
                
                } label: {
                    EditButtonView(text: "지금 시작하기")
                }

            }
        
    }
}


struct EditButtonView: View {
    
    
    var text: String
    
    
    
    var body: some View {
 
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("main"))
                .frame(height: 50)
                .padding(20)
                
                
            
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
        }
        
        
    }
}


struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView(rootIsActive: .constant(true))
    }
}
