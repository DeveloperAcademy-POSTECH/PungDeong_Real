//
//  ResultBarView.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/08.
//

import SwiftUI


struct ResultData: Identifiable {
    
    let id: Int
    let score: Double
    
    var description: String? {
        
        switch self.id {
        case 1:
            return "정보 재확인"
        case 2:
            return "근거 조사"
        case 3:
            return "전문가 자문"
        case 4:
            return "사실 재확인"
        case 5:
            return "중립"
        default:
            print("DEBUG: 잘못된 타입 값입니다.")
            return nil
        }
    }
}


struct ResultBarView: View {
    
    var result: UserInfo
    
    //데이터 건네져 옴
    var resultData: [ResultData]  {
        return [
            ResultData(id: 1, score: Double(score(index: 0))),
            ResultData(id: 2, score: Double(score(index: 1))),
            ResultData(id: 3, score: Double(score(index: 2))),
            ResultData(id: 4, score: Double(score(index: 3))),
            ResultData(id: 5, score: Double(score(index: 4)))
        ]
    }
    
    func score(index: Int) -> Int {
        guard let selects = result.test?.selects else { return 0 }
        
        return selects[index]
    }
    
    
    var body: some View {
     
        VStack {
            ForEach(resultData) { result in
                
                HStack {
                    Spacer()
                    
                    Text("\(result.description ?? "")")
                        .fontWeight(.semibold)
                        .frame(alignment: .trailing)
                        .padding(.horizontal)
                    
                    
                    ZStack {
                        ProgressView(value: result.score, total: 5)
                            .frame(width: 150,height: 16)
                            .padding(.trailing, 30)
                            .progressViewStyle(ResultProgressStyle())
                            .tint(result.score > 3 ? Color.pink : Color("main"))
                        
                    }
                }
            }
        }
    }
}

struct ResultBarView_Previews: PreviewProvider {
    static var previews: some View {
        ResultBarView(result: UserInfo())
    }
}
