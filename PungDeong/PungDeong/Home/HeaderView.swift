//
//  HeaderView.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/10.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5){
                Text("Welcome!")
                    .font(.system(.largeTitle, design:.rounded))
                    .fontWeight(.black)
                    .foregroundColor(Color("main"))
                Text("정보의 바다에 풍덩!")
                    .font(.title3)
                    .foregroundColor(Color("CustomBlue"))
                Text("매일매일 새로운 소식과 정보가 쏟아지는 바닷속 마을. 이곳에 잘 적응하기 위해서는 정보활용능력을 필수적으로 갖춰야 해요. 밀려드는 정보의 파도들을 어떤 방식으로 헤쳐나갈지, 여러분의 정보활용 유형을 알아볼까요?")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}
