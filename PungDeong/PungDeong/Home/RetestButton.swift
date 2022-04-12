//
//  RetestButton.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/12.
//

import SwiftUI

struct RetestButton: View {
    var body: some View {
        Text("테스트 다시하기")
            .frame(width: 200, height: 50, alignment: .center)
            .background(Color(red: 125/255, green: 237/255, blue: 255/255, opacity: 1.0))
            .foregroundColor(Color.white)
            .cornerRadius(8)
            .padding()
            .padding()
    }
}

struct RetestButton_Previews: PreviewProvider {
    static var previews: some View {
        RetestButton()
    }
}
