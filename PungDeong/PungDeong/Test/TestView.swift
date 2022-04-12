//
//  TestView.swift
//  PungDeong
//
//  Created by Dongjin Jeon on 2022/04/07.
//

import SwiftUI

struct TestView: View {
    
    
    //Pop to root View 를 위한 navigation View is Active
    @Binding var rootIsActive : Bool

    
    var body: some View {
        TestPageView(rootIsActive: self.$rootIsActive, test: test, currentItem: test.pages[0])
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(rootIsActive: .constant(true))
    }
}
