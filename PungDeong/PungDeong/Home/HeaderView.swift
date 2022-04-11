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
//            VStack(alignment: .leading, spacing: 5){
                Text("Welcome!")
                    .font(.system(.largeTitle, design:.rounded))
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 124/255, green: 131/255, blue: 253/255, opacity: 1.0))
//                Text("평화로운 바다 마을에 오신 것을 환영해요!")
//                    .font(.title2)
//            }
            Spacer()
        }
    }
}
