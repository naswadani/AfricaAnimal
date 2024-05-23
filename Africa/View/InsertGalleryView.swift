//
//  InsertGalleryView.swift
//  Africa
//
//  Created by naswakhansa on 29/11/23.
//

import SwiftUI

struct InsertGalleryView: View {
    let animal : Animal
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment : .center, spacing: 15){
                ForEach(animal.gallery, id: \.self){item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(15)
                }
            }
        }
    }
}

#Preview {
    InsertGalleryView(animal: animals[0])
}
