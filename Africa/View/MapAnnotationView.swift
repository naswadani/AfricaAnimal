//
//  MapAnnotationView.swift
//  Africa
//
//  Created by naswakhansa on 06/12/23.
//

import SwiftUI

struct MapAnnotationView: View {
    var location : NationalParkLocations
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .fill()
                .frame(width: 54, height: 54, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Circle()
                .stroke(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

let locations : [NationalParkLocations] = Bundle.main.decode("locations.json")
#Preview {
    MapAnnotationView(location: locations[0])
        .padding()
}
