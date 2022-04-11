//
//  TestModel.swift
//  PungDeong
//
//  Created by Dongjin Jeon on 2022/04/07.
//

import Foundation
import SwiftUI

struct Test {
    
    let pages: [TestPage]
    
    subscript(_ pageIndex: Int) -> TestPage {
        return pages[pageIndex]
    }
}

struct TestPage {
    let text: String
    
    let choices:[Choice]
    
    init(_ text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
}

struct Choice {
    let id: UUID?
    let text: String
    let type: Int
    
    init(text:String, type:Int) {
        self.id = UUID()
        self.text = text
        self.type = type
    }
}

struct Answer {
    static var answeredType: [Int] = {
        return [Int](repeating: 0, count: 20)
    }()
}
