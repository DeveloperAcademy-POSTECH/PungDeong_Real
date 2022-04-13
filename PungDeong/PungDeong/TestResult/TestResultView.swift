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
    
    var tpye: Int {
        userInfo.test?.type ?? 0
    }
    
    var data: resultData {
        
        print("DEBUG: Type is \(userInfo.test?.type ?? 0)")
        return viewModel.resultType(userInfo.test?.type ?? 0)
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
                }
                
                ShareMenu(delegate: self)
            }
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            if let image = body.takeScreenshot(origin: CGPoint(x: 0, y: 50), size: CGSize(width: 600, height: 680)) {
                viewModel.saveImage(image: image)
            } else {
                print("DEBUG : image Capture Failed")
            }
        }
        
    }
    
    
    func sharePhotoButtonTapped() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
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
