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
            
            Text(music.title)
                .font(.title)
                .foregroundColor(.primary)
            
            Text("Singer: \(music.artist.name)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Album: \(music.album.title)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Duration: \(music.duration)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Button(action: {
                if let mediaURL = URL(string: music.preview) {
                    MediaManager.playMedia(mediaURL: mediaURL)
                }
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .navigationBarTitle("Music Details", displayMode: .inline)
    }
}

//#Preview {
//    MusicDetailView(music: Track())
//}
