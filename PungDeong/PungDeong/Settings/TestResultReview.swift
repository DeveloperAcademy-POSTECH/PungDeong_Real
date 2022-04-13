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
    
    var suggestionData: reviewData {
        var typeResult = 0
        var typeMin = 10
        var index = 0
        print(userInfo.test!.selects)
        print(userInfo.test!.type)
        // var arr = userInfo.test!.selects.filter { $0 != userInfo.test!.type}
        var arr: [Int] = userInfo.test!.selects.map {
        if $0 == userInfo.test!.type {
            return 10
            } else {
                return $0
                }
            }
            print(arr)
            for i in arr {
            if (i < typeMin) {
                typeMin = i
                typeResult = arr.index(of: typeMin)!+1
            }
        }
        print(typeMin)
        return viewModel.resultReviewType(typeResult)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    VStack {
                        Text("당신의 결과는...")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(data.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("character_\(data.type)"))
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20 )
                            
                        Image("character_\(data.type)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 2.4, height: geometry.size.width / 2.4)
                        
                    }
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
                    VStack {
                        Text("\(suggestionData.name)과도 친해져보세요!")
                            .font(.title3)
                            .foregroundColor(Color("CustomBlue"))
                            .padding(5)
                        Image("character_\(suggestionData.type)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 2.4, height: geometry.size.width / 2.4)
                        }
                        //.border(.cyan, width: 1)
                        .padding(.bottom, 10)
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
