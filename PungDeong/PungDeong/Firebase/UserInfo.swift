//
//  UserInfo.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/10.
//

import SwiftUI

class UserInfo: ObservableObject {
    @Published var email : String?
    @Published var test : Test?
    @Published var content1 : Content1?
    @Published var content2 : Content2?
}

struct Test: Codable {
    //var complete: Bool
    var selects: [Int]
    var type: Int
}

struct Content1: Codable {
    //var complete: Bool
}

struct Content2: Codable {
    //var complete: Bool
}
