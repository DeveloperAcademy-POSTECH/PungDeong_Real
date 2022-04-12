//
//  TestResultModel.swift
//  PungDeong
//
//  Created by GOngTAE on 2022/04/12.
//

import Foundation

func resultType(_ type: Int) -> resultData {
    var result: resultData
    switch type {
        case 1:
            result = resultData(type: "1", name: "프로 팩트체커 교직원 우파루파", hastag: ["해시태그1", "해시태그2"], description: "당신은 팩트체크가 생활화된 우파루파!", image: "google")
        case 2:
            result = resultData(type: "2", name: "박학다식 대학원생 해달", hastag: ["해시태그1", "해시태그2"], description: "당신은 전문 지식을 중시하는 해달이에요! 사실 여부가 확실하지 않은 정보를 접하면 그냥 받아들이기 보다는 전문가의 조언을 구하는 당신의 모습이 마치 박학다식한 대학원생 같군요.", image: "google")
        case 3:
            result = resultData(type: "3", name: "꼼꼼한 과대표 금붕어", hastag: ["해시태그1", "해시태그2"], description: "당신은 꼼꼼하고 신중한 금붕어!", image: "google")
        case 4:
            result = resultData(type: "4", name: "논리적인 수험생 돌고래", hastag: ["해시태그1", "해시태그2"], description: "논리가 중요한 당신! 논리주의자 돌고래예요.", image: "google")
        case 5:
            result = resultData(type: "5", name: "중립기어 마을이장 거북이", hastag: ["해시태그1", "해시태그2"], description: "중립이 중요한 당신! 중립기어를 넣는 중재자 거북이예요.", image: "google")
        default:
            result = resultData(type: "", name: "", hastag: [""], description: "", image: "")
    }
    return result
}

struct resultData {
    var type: String
    var name: String
    var hastag: [String]
    var description: String
    var image: String
}
