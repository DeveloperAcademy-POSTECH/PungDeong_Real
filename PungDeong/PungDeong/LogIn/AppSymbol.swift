//
//  AppSymbol.swift
//  PungDeong
//
//  Created by 김상현 on 2022/04/06.
//

import SwiftUI

struct AppSymbol: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        Image("풍덩 심볼")
            .resizable()
            .frame(width: screenWidth * 0.4, height:  screenWidth * 0.4, alignment: .center)
            .aspectRatio(contentMode: .fit)
    }
}
