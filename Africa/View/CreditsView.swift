//
//  CreditsView.swift
//  Africa
//
//  Created by naswakhansa on 22/01/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright © Naswa Bryna Danikhansa
    All right reversed
    Better Apps ♡ Less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
    
}

#Preview {
    CreditsView()
        .previewLayout(.sizeThatFits)
        .padding()
}
