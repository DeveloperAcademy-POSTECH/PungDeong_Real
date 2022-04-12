//
//  ResultTopView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/08.
//

import SwiftUI

struct ResultTopView: View {
    
    
    
    
    
    var body: some View {
    
        GeometryReader { geometry in
            VStack {
                Text("당신의 결과는...")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    
                
                Text("프로 팩트체커 우파루파")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                    
                
                Image("oopa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width / 2, height: geometry.size.width / 2)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.width)
        }
        
    }
}


struct Result {
    
}

struct ResultTopView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTopView()
    }
}
