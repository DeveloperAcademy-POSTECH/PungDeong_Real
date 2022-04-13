//
//  SwiftUIView.swift
//  PungDeong
//
//  Created by woo0 on 2022/04/12.
//

import SwiftUI

struct TestResultReview: View {
    var viewModel =  TestResultViewModel()
    var userInfo: UserInfo
    var tpye: Int {
        userInfo.test?.type ?? 0
    }
    var data: resultData {
        return viewModel.resultType(userInfo.test?.type ?? 0)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ResultTopView(result: self.data)
                        .frame(width: geometry.size.width, height: geometry.size.width)
                    ResultBarView(result: self.userInfo)
                        .offset(x: -geometry.size.width / 10)
                    HStack {
                        Text("#\(data.hastag[0]) #\(data.hastag[1])")
                            .fontWeight(.bold)
                            .padding(.leading, 25)
                        Spacer()
                    }
                    .padding(.top, 10)
                    Text(viewModel.resultType(userInfo.test?.type ?? 0).description)
                        .lineLimit(6)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .padding(.horizontal, 20)
                        .padding(.top, 1)
                }
            }
        }
    }
}

struct TestResultReview_Previews: PreviewProvider {
    static var previews: some View {
        TestResultReview(userInfo: UserInfo())
    }
}
