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
                Text("평화로운 바다 마을에 오신 것을 환영해요!")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}
