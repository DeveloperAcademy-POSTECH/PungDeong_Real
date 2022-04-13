//
//  userDelete.swift
//  PungDeong
//
//  Created by woo0 on 2022/04/13.
//

import SwiftUI

class UserDelete: ObservableObject {
    @Published var count: Bool
    init(count: Bool) {
        self.count = count
    }
}
