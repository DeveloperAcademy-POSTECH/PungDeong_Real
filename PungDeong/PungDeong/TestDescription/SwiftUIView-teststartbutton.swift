//
//  SwiftUIView-teststartbutton.swift
//  PungDeong
//
//  Created by 전호정 on 2022/04/11.
//

import SwiftUI

struct SwiftUIView_teststartbutton: View {
    
    var description: String = "테스트 시작하기"
    
    var body: some View {
        //버튼의 보여지는 UI 코드
        Text("\(description)")
            .font(.system(size:30, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 0.359, green: 0.731, blue: 0.963))
            .clipShape(Capsule())
        .overlay(Capsule().stroke(Color(red: 0.359, green: 0.731, blue: 0.963), lineWidth: 5))
    }
}


struct SwiftUIView_teststartbutton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_teststartbutton()
    }
}
