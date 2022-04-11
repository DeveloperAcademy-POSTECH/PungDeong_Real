//
//  TestPageView.swift
//  PungDeong
//
//  Created by Dongjin Jeon on 2022/04/07.
//

import SwiftUI



struct TestPageView: View {
    
    
    //MARK: - Propeties
    
    let test: Test
    @State var pageIndex: Int = 0
    @State var currentItem: TestPage
    
    init(test: Test) {
        self.test = test
        self.currentItem = test.pages[0]
    }
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @State private var showingAlert = false
    @State private var isLastPageToggle = false
    @State private var isLastPageToggleSave = false
    
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
        }
        
    }
    
    var body: some View {
        ZStack {
            // Background Color
            Color("TestBackground").ignoresSafeArea()
            
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
                    .padding(.bottom, 10)
            
                Text(test.pages[pageIndex].text)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .font(.title3)
                    .background()
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                
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
        }
    }
}




struct SelectButtonView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 140)
            .background(Color("TestButton"))
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
            .font(.body)
            .foregroundColor(Color.black)
            .background(Color.white)
            .cornerRadius(100.0).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
            ).opacity(inVisible ? 0 : 1 )
            .disabled(inVisible)

    }
}

struct PageIndexButtonView: View {
    var pageIndex: Int
    
    var body: some View {
        
        Text(" \(pageIndex+1) / \(test.pages.count) ")
            .frame(width: 80, height: 44)
            .font(.body)
            .foregroundColor(Color.black)
            .background(Color.white)
            .cornerRadius(100.0).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
            )
            .disabled(true)

    }
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TestPageView(test: test)
        }
        .previewInterfaceOrientation(.portrait)
    }
}
