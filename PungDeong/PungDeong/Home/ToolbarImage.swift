//
//  ToolbarImage.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/10.
//

import SwiftUI

struct ToolbarImage: View {
    var body: some View {
        Image(systemName: "person.crop.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 35.0)
            .foregroundStyle(
                .linearGradient(
                    colors: [Color(.sRGB, red: 125/255, green: 237/255, blue: 255/255), Color(.sRGB, red: 150/255, green: 186/255, blue: 255/255)],
                    startPoint: .top,
                    endPoint: .bottom
                )
//            .foregroundColor(Color(.sRGB, red: 254/255, green: 209/255, blue: 239/255)
            )
    }
}
