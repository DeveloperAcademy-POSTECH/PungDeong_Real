//
//  TestResultView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/07.
//

import SwiftUI
import UIKit




struct TestResultView: View {
    
    var viewModel =  TestResultViewModel()
    
    var userInfo: UserInfo
    
    @State private var showingAlert = false
    
    var tpye: Int {
        userInfo.test?.type ?? 0
    }
    
    var data: resultData {
        
        print("DEBUG: Type is \(userInfo.test?.type ?? 0)")
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
   
    
    @Binding var shouldPopToRootView: Bool
    
    
//
//    var onlyResultView: some View = {
//        GeometryReader { geometry in
//
//        }
//    }()
//
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    ScrollView {
                        VStack {

                            ResultTopView(result: self.data)
                                .frame(width: geometry.size.width, height: geometry.size.width / 1.2)
                                .padding(.top, 20)
                                
                            
                            ResultBarView(result: self.userInfo)
                                .offset(x: -geometry.size.width / 10, y: -30)
                            
                            
                            HStack {
                                Text("#\(data.hastag[0]) #\(data.hastag[1])")
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    
                            
                                Spacer()
                            }
                            .padding(.leading, 25)
                            
                            
                            Text(viewModel.resultType(userInfo.test?.type ?? 0).description)
                                .lineLimit(6)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.body)
                                .padding(.horizontal, 20)
                                .padding(.top, 1)
                                .padding(.bottom, 10)
                            
                            VStack(alignment: .center) {
                                Text("당신의 부족한 부분을 채우고 싶으세요?")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                Text("\(suggestionData.name)")
                                    .font(.body)
                                    .foregroundColor(Color("CustomBlue"))
                                    .padding(.vertical, 5)
                                
                                HStack {
                                    Image("character_\(suggestionData.type)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width / 2.4, height: geometry.size.width / 2.4)
                                }
                                
                            }
                            //.border(.cyan, width: 1)
                            .padding(10)
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    
                                
                    Spacer()
                    
                    HStack {
                        
                        Button {
                            print("DEBUG: Button has tapped")
                            
                            // 메인화면 이동 메서드 호출
                            self.shouldPopToRootView = false
                            
                            
                        } label: {
                            HStack {
                                Text("메인화면으로 가기")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .frame(width: 260, height: 55)
                            .foregroundColor(.white)
                            .background(Color("main"))
                            .cornerRadius(10)
                            
                        
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                }
                
                ShareMenu(delegate: self)
            }
        }
        .alert("스크린 캡쳐됨", isPresented: $showingAlert) {
            Button("Ok") {}
        } message: {
            Text("테스트 결과가 사진 앨범에 저장되었습니다.")
        }

    }
}




extension TestResultView: ShareButtonDelegate {
    func kakaoButtonTapped() {
        print("DEBUG: kakao delegate method")
        viewModel.shareKakao()
    }
    
    func savePhotoButtonTapped() {
        print("DEBUG: save photo delegate method")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            if let image = body.takeScreenshot(origin: CGPoint(x: 0, y: 50), size: CGSize(width: 600, height: 680)) {
                viewModel.saveImage(image: image)
                showingAlert = true
            } else {
                print("DEBUG : image Capture Failed")
            }
        }
        
    }
    
    
    func sharePhotoButtonTapped() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            if let image = body.takeScreenshot(origin: CGPoint(x: 0, y: 50), size: CGSize(width: 600, height: 680)) {
                viewModel.sharePicture(img: image)
            } else {
                print("DEBUG : image Capture Failed")
            }
        }
    }
}


//MARK: - 프로그레스 바 뷰 스타일

struct ResultProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            
            let width: CGFloat = geometry.size.width
            
            ZStack(alignment: .leading) {
                       RoundedRectangle(cornerRadius: 5)
                           .frame(width: width, height: 10)
                           .foregroundColor(.gray.opacity(0.1))
                           .overlay(Color.black.opacity(0.5)).cornerRadius(14)
                       
                       RoundedRectangle(cornerRadius: 5)
                           .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * width, height: 10)
                           .foregroundColor(Color("main"))
                
                //반응형 UI 로 로직 수정 필요
                ForEach(1..<5) { i in
                    Rectangle()
                        .frame(width: 1.5, height: 10)
                        .foregroundColor(.white)
                        .offset(x: CGFloat(-2 + i * Int(width) / 5))
                }
            }
        }
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {

        TestResultView(userInfo: UserInfo(), shouldPopToRootView: .constant(true))

    }
}

