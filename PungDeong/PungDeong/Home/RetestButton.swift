//
//  RetestButton.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/12.
//

import SwiftUI

struct RetestButton: View {
    
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Text(userInfo.test == nil ? "테스트 시작하기" : "테스트 다시하기")
            .fontWeight(.bold)
            .frame(height: 50, alignment: .center)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.455, green: 0.702, blue: 1.000, opacity: 1.0))
            .foregroundColor(Color.white)
            .cornerRadius(8)
            
    }
}

struct RetestButton_Previews: PreviewProvider {
    static var previews: some View {
        RetestButton()
    }
}
