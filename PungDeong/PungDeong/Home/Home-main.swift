//
//  Home-main.swift
//  PungDeong
//
//  Created by Seulki Lee on 2022/04/07.
//

import SwiftUI


struct Home_main: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    VStack {
                        Image("물개")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 2,
                                   alignment: .center)
                            .padding()
                        
                        HeaderView()
                        
                        HStack{
                            NavigationLink(
                                destination: Text("Game 1"),
                                label: {
                                    CardView(image: "작은물개", category: "1st Challenge", heading: "미니컨텐츠1", description: "first game comes here",
                                             geometry: geometry)
                                })
                            
                            NavigationLink(
                                destination: Text("Game 2"),
                                label: {
                                    CardView(image: "작은물개", category: "2nd Challenge", heading: "미니컨텐츠2", description: "second game comes here", geometry: geometry)
                                })
                        }
                        
                        NavigationLink(
                            destination: Text("Game 3"),
                            label: {
                                CardView(image: "물개", category: "3rd Challenge", heading: "미니컨텐츠3", description: "the last game comes here", geometry: geometry)
                            })
                        Spacer()
                        
                    }
                    .padding()
                    .toolbar {
                        NavigationLink(
                            destination: Text("Profile"),
                            label: {
                                ToolbarImage()
                            })
                    }
                    .navigationBarItems(leading: Image("심볼")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, alignment: .topLeading))
                }
            }
        }
    }
}

struct Home_main_Previews: PreviewProvider {
    static var previews: some View {
        Home_main()
    }
}
