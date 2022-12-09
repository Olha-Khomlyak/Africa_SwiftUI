//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Olha Khomlyak on 8.12.2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {

    var videoSelected:String
    var videoTitle: String

    var body: some View {
        VStack{
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")){
            }
            .overlay (
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 6)
                , alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
