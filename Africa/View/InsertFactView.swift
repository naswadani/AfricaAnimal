//
//  InsertFactView.swift
//  Africa
//
//  Created by naswakhansa on 30/11/23.
//

import SwiftUI

struct InsertFactView: View {
    let animal : Animal
    var body: some View {
        Group{
            TabView{
                ForEach(animal.fact, id:\.self){item in
                    Text(item)
                    
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(idealWidth: 168, minHeight: 148, maxHeight: 180)
        }
    }
}

#Preview {
    InsertFactView(animal:animals[0])
        .previewLayout(.sizeThatFits)
        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
}
