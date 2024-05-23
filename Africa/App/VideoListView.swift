//
//  VideoListView.swift
//  Africa
//
//  Created by naswakhansa on 28/11/23.
//

import SwiftUI

struct VideoListView: View {
    let hepticImpact = UIImpactFeedbackGenerator(style: .medium)
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    var body: some View {
        NavigationView{
            List{
                ForEach(videos){item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action :{
                        videos.shuffle()
                        hepticImpact.impactOccurred()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

#Preview {
    VideoListView()
}
