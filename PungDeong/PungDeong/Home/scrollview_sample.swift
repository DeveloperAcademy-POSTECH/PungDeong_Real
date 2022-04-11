//
//  scrollview_sample.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/10.
//

import SwiftUI

struct scrollview_sample: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0..<100) {
                    Text("Row \($0)")
                }
            }
        }
    }
}

struct scrollview_sample_Previews: PreviewProvider {
    static var previews: some View {
        scrollview_sample()
    }
}
