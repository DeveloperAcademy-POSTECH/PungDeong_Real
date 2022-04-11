//
//  CardView.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/10.
//

import SwiftUI

struct CardView: View {
    var image: String
    var category: String
    var heading: String
    var description: String
    var geometry: GeometryProxy

    var body: some View {
        VStack(spacing: 20) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width / 3)
                .padding()
            
            HStack{
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                Spacer()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 250)
        .padding(10)
//        .background(Color(.sRGB, red: 255/255, green: 248/255, blue: 243/255))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 28/255, green: 109/255, blue: 208/255, opacity: 0.2), lineWidth: 1)
            )
//        .cornerRadius(20)
    }
}
