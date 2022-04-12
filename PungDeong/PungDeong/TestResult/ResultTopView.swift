//
//  ResultTopView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/08.
//

import SwiftUI

struct ResultTopView: View {
    
    var result: resultData
    
    
    
    var body: some View {
    
        GeometryReader { geometry in
            VStack {
                Text("당신의 결과는...")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    
                
                Text(result.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("character_\(result.type)"))
                    
                
                Image("character_\(result.type)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width / 2.4, height: geometry.size.width / 2.4)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.width)
        }
        
    }
}


struct Result {
    
}

struct ResultTopView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTopView(result: resultData(type: "2", name: "박학다식 대학원생 해달", hastag: ["해시태그1", "해시태그2"], description: "당신은 전문 지식을 중시하는 해달이에요! 사실 여부가 확실하지 않은 정보를 접하면 그냥 받아들이기 보다는 전문가의 조언을 구하는 당신의 모습이 마치 박학다식한 대학원생 같군요.", image: "google"))
    }
}
