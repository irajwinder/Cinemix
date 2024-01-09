//
//  MusicDetailView.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

struct MusicDetailView: View {
    var music: Track
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            LazyImage(url: URL(string: music.album.cover_medium))
            
            CustomPrimaryText(text: music.title)
            
            CustomSecondayText(text: "\(ListConstants.singer): \(music.artist.name)")
            
            CustomSecondayText(text: "\(ListConstants.album): \(music.album.title)")
            
            CustomSecondayText(text: "\(ListConstants.duration): \(music.duration)")
            
            CustomPlayButton {
                if let mediaURL = URL(string: music.preview) {
                    MediaManager.playMedia(mediaURL: mediaURL)
                }
            }
        }
        .padding()
        .navigationBarTitle(ListConstants.navigationTextMusicDetail, displayMode: .inline)
    }
}

//#Preview {
//    MusicDetailView(music: Track())
//}
