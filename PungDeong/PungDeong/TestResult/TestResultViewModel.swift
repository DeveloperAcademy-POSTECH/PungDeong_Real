//
//  TestResultViewModel.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/07.
//

import SwiftUI

import Alamofire

import KakaoSDKLink
import KakaoSDKCommon
// 기본 템플릿 사용 시 필요
import KakaoSDKTemplate



class TestResultViewModel: NSObject {
    
    
    
    
    func resultType(_ type: Int) -> resultData {
        
        var result: resultData
        
        switch type {
            case 1:
                result = resultData(type: "1", name: "프로 팩트체커 변호사 우파루파", hastag: ["슬기로운_팩트체크생활", "의심쟁이"], description: "당신은 팩트체크가 생활화된 우파루파! 사소한 정보 하나라도 그냥 넘겨짚지 않고 팩트체크를 하는 모습이 마치 성실하고 유능한 변호사 같아요. 불확실한 사실의 폭풍으로부터 마을을 지켜주는 한 줌의 빛이 되어주는 것은 어떤가요?", image: "character_1")
            case 2:
                result = resultData(type: "2", name: "전문적인 척척석사 해달", hastag: ["TMI", "박사까지_가즈아~!"], description: "당신은 전문 지식을 중시하는 해달이에요! 사실 여부가 확실하지 않은 정보를 접하면 그냥 받아들이기 보다는 전문가의 조언을 구하는 당신의 모습이 마치 척척석사 같군요. 주변 이웃들이 어려움을 겪을 때 당신의 박학다식함으로 도움을 주는 건 어떤가요?", image: "character_2")
            case 3:
                result = resultData(type: "3", name: "꼼꼼한 카페 알바생 금붕어", hastag: ["되묻기장인", "그만_좀_신중해도_돼"], description: "당신은 꼼꼼하고 신중한 금붕어! 무슨 말을 듣든 대충 넘기지 않고 다시 한번 확인하는 빈틈없는 성격이 마치 성실하고 평 좋은 카페 알바생 같아요! 당신의 신중한 성격으로 정보 선별에 어려움을 겪는 이웃들을 도와주는 건 어떨까요?", image: "character_3")
            case 4:
                result = resultData(type: "4", name: "논술 만점 우등생 돌고래", hastag: ["논리만렙", "범생이"], description: "논리가 중요한 당신은 논술 만점에 빛나는 돌고래! 근거가 빈약한 주장을 꺼려하는 한편, 근거가 탄탄하다면 반대되는 주장도 받아들일 준비가 되어있어요. 이런 당신의 모습은 마치 논술 만점을 받은 우등생 같네요! 당신의 뛰어난 논리력으로 문제에 처한 이웃들을 도와주는 건 어떨까요?", image: "character_4")
            case 5:
                result = resultData(type: "5", name: "중립기어 마을이장 거북이", hastag: ["일단중립박아", "그래_네_말도_맞다"], description: "중립이 중요한 당신! 중립기어를 넣는 중재자 거북이예요. 편향된 의견에 쉽게 영향받지 않고 늘 신중한 태도로 사실 관계를 따져보는 모습이 마치 지혜로운 이장님 같네요! 당신의 신중하고 중립적인 태도는 마을 사람들의 갈등을 해결하는 중요한 열쇠가 되지 않을까요?", image: "character_5")
            default:
                result = resultData(type: "", name: "", hastag: [""], description: "", image: "")
        }
        return result
    }
    
    //카카오로 결과 공유
    func shareKakao() {
        
        //결과 공유  type 1 ID
        let templateId = 74828
        
        LinkApi.shared.customLink(templateId: Int64(templateId)) { (linkResult, error) in
            if let error = error {
                print(error)
            }
            else {
                print("customLink() success.")
                if let linkResult = linkResult {
                    // 카카오톡 오픈
                    UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    
    @objc func photoSaveCompleted() {
        print("DEBUG: photo saved completely")
    }
    
    
    func saveImage(image: UIImage) {
        print("DEBUG: image save to Photo album...")
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    func sharePicture(img: UIImage) {
        print("DEBUG: image sharing...")
        
        let av = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}
