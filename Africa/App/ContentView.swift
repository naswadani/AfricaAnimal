//
//  ContentView.swift
//  Africa
//
//  Created by naswakhansa on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive : Bool = false
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("grid Number : \(gridColumn)")
        
        switch gridColumn {
        case 1 :
            toolbarIcon = "square.grid.2x2"
        case 2 :
            toolbarIcon = "square.grid.3x2"
        case 3 :
            toolbarIcon = "rectangle.grid.1x2"
        default :
            toolbarIcon = "square.grid.2x2"
        }
    }
    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals){item in
                            NavigationLink(destination : AnimalDetailView(animal: item)){
                                AnimalListItemView(animal: item)
                            }
                        }
                        CreditsView()
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing : 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing : 16){
                        //List
                        Button(action :{
                            print("List view is Activated")
                            isGridViewActive = false
                            haptic.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        //Grid
                        Button(action:{
                            print("grid view is activated")
                            isGridViewActive = true
                            haptic.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName: toolbarIcon)
                                .font(.title)
                                .foregroundColor( isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
