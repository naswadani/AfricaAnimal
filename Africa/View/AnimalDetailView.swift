//
//  AnimalDetailView.swift
//  Africa
//
//  Created by naswakhansa on 29/11/23.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal : Animal
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                //Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                //Name
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                //HeadLine
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsertGalleryView(animal: animal)
                }.padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsertFactView(animal: animal)
                }.padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }.padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "map", headingText: "National Park")
                    InsertMapView()
                }.padding(.horizontal)
                
                Group{
                    HeadingView(headingImage: "books.ver", headingText: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                
                
                    
            }.navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }
    }
}


#Preview {
    AnimalDetailView(animal: animals[0])
}
