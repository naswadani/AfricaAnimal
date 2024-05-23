//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by naswakhansa on 22/01/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal : Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    AnimalGridItemView(animal: animals[0])
        .previewLayout(.sizeThatFits)
        .padding()
}
