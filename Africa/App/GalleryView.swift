//
//  GalleryView.swift
//  Africa
//
//  Created by naswakhansa on 28/11/23.
//

import SwiftUI

struct GalleryView: View {
    //Properties
    @State  private var selectedAimal : String = "lion"
    let animals : [Animal] = Bundle.main.decode("animals.json")
//    let gridLayout:[GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//     ]
    
    //Eficient grid definition
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColoum : Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColoum))
    }
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    //Main
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment : .center, spacing: 30) {
                
                Image(selectedAimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth : 8))
                
                Slider(value: $gridColoum, in: 2...4, step : 1)
                    .padding(.horizontal)
                    .onChange(of: gridColoum, perform : {value in
                        gridSwitch()
                    })
                LazyVGrid (columns : gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAimal = item.image
                                haptics.impactOccurred()
                            }
                        
                    }//Loop
                }//grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//vstack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
