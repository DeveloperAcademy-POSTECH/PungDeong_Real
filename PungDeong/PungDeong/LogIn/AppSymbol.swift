//
//  AppSymbol.swift
//  PungDeong
//
//  Created by κΉμν on 2022/04/06.
//

import SwiftUI

struct AppSymbol: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: screenWidth * 0.6, height:  screenWidth * 0.6, alignment: .center)
            .aspectRatio(contentMode: .fit)
    }
}
