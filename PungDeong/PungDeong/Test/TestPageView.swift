//
//  TestPageView.swift
//  PungDeong
//
//  Created by Dongjin Jeon on 2022/04/07.
//

import SwiftUI



struct TestPageView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    
    //Pop to root View 를 위한 navigation View is Active
    @Binding var rootIsActive: Bool
    
    //MARK: - Propeties
    
    let test: Test
    @State var pageIndex: Int = 0
    @State var currentItem: TestPage
    
    @State var isFinished: Bool = false
    
    //binding 수정 요망


    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State private var showingAlert = false
    @State private var isLastPageToggle = false
    @State private var isLastPageToggleSave = false
    
    func makeTestesult() -> [Int] {
        
        var testResult: [Int] = [Int](repeating: 0, count: 5)
        
        for type in Answer.answeredType {
            if(type > 0 && type < 6) {
                testResult[type - 1] += 1
            }
        }
        return testResult
    }
    
    func selectingType(index: Int) {
        let selectedType = test.pages[pageIndex].choices[index].type
        
        Answer.answeredType[pageIndex] = selectedType
        print(Answer.answeredType)
        
        //페이징 넘기기
        if(pageIndex != test.pages.count - 1){
            pageIndex = pageIndex + 1
            self.currentItem = test.pages[pageIndex]
            
            
        } else {
            // View 전환 메서드 호출
            
            
            
            let testResult = makeTestesult()
            print(testResult)
            
            var typeResult = 0
            var typeMax = 0
            var index = 0
            for i in testResult {
                index += 1
                if (i > typeMax) {
                    typeMax = i
                    typeResult = index
                }
            }
            userInfo.test = Test1(selects: testResult, type: typeResult)
            FirebaseDB().addTest(email: userInfo.email ?? "", test: Test1(selects: testResult, type: typeResult))
            
            self.isFinished.toggle()
       
        }
        
    }
    
    var body: some View {
        ZStack {
            // Background Color
            Image("test_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                
                
                
            
            VStack {
                
                HStack {
                    Button {
                        if(pageIndex != 0) {
                            self.pageIndex = pageIndex - 1
                            self.currentItem = test.pages[pageIndex]
                        }
                        print("leftButton Clicked")
                    } label: {
                        NavButtonView(text: "arrow.left", pageIndex: pageIndex)
                    }
                    
                    Button {
                        if(pageIndex != test.pages.count - 1) {
                            self.pageIndex = pageIndex + 1
                            self.currentItem = test.pages[pageIndex]
                        }
                        print("rightButton Clicked")
                    } label: {
                        NavButtonView(text: "arrow.right", pageIndex: pageIndex)
                    }
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        PageIndexButtonView(pageIndex: pageIndex)
                    }
                   
                }
                    .padding(.bottom, 6)
            
                Text(test.pages[pageIndex].text)
                    .frame(maxWidth: .infinity)
                    .font(.body)
                    .lineSpacing(4.0)
                    .background()
                    .padding(20)
                    .padding(.vertical, 10)
                    .background()
                    .cornerRadius(20).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    
                
              Spacer()
                
                
                VStack {
                    Button {
                        print("DEBUG: 첫번째 선택지 tapped")
                        selectingType(index: 0)
                        
                    } label: {
                        SelectButtonView(text: test.pages[pageIndex].choices[0].text)
                    }
                    
                    
                    Button {
                        print("DEBUG: 두번째 선택지 tapped")
                        selectingType(index: 1)
                    } label: {
                        SelectButtonView(text: test.pages[pageIndex].choices[1].text)
                    }
                   
                    
                    Button {
                        print("DEBUG: 세번째 선택지 tapped")
                        selectingType(index: 2)
                    } label: {
                        SelectButtonView(text: test.pages[pageIndex].choices[2].text)
                    }
                }
                
                
                
              
            }
            .padding(20)
            .padding(.vertical, 20)
        }
        .background(
            NavigationLink(isActive: $isFinished, destination: {
                TestResultView(userInfo: userInfo, shouldPopToRootView: $rootIsActive)
                    .navigationBarHidden(true)
            }, label: {
                EmptyView()
            })
        )
        .onDisappear {
            // 뷰가 사라지기 전에 네트워킹 메서드를 통해 전달
        }
    }
}




struct SelectButtonView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("main"))
            .cornerRadius(10)

    }
}

struct NavButtonView: View {
    
    var text: String
    var pageIndex: Int
    
    var body: some View {
        
        let inVisible = ((text == "arrow.left") && (pageIndex == 0))||((text == "arrow.right") && (pageIndex == test.pages.count - 1))
        Image(systemName: text)
            .frame(width: 44, height: 44)
            .font(.subheadline)
            .foregroundColor(Color.black)
            .background(Color.white)
            .cornerRadius(100.0).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            ).opacity(inVisible ? 0 : 1 )
            .disabled(inVisible)

    }
}

struct PageIndexButtonView: View {
    var pageIndex: Int
    
    var body: some View {
        
        Text(" \(pageIndex+1) / \(test.pages.count) ")
            .frame(width: 72, height: 44)
            .font(.footnote)
            .foregroundColor(Color.black)
            .background(Color.white)
            .cornerRadius(100.0).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            .disabled(true)

    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView(rootIsActive: .constant(true), test: test, currentItem: test.pages[0])
    }
}
