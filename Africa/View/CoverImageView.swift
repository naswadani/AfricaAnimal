//
//  CoverImageView.swift
//  Africa
//
//  Created by naswakhansa on 28/11/23.
//

import SwiftUI

struct CoverImageView: View {
    //Properties
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    
    //Body
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//Loop
        }//TabView
        .tabViewStyle(PageTabViewStyle())
        
    }
}

#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
