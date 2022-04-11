//
//  newscreen.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/10.
//

import SwiftUI

struct newscreen: View {
    var body: some View {
        GeometryReader{ g in
            HStack{
                Text("1")
                    .frame(width: g.size.width / 2, height: g.size.height, alignment: .center)
                    .background(Color.mint)
                Text("2")
                    .frame(width: g.size.width / 2, height: g.size.height, alignment: .center)
                    .background(Color.pink)
            }
        }    }
}

struct newscreen_Previews: PreviewProvider {
    static var previews: some View {
        newscreen()
    }
}
