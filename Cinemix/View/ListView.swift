//
//  ListView.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

struct ListView: View {
    @StateObject private var stateObject = MusicListIntent()
    @ObservedObject var observedObject: SearchIntent
    
    @State private var showAlert = false
    @State private var alert: Alert?
    
    var body: some View {
        List {
            ForEach(observedObject.musicResponse, id: \.id) { music in
                NavigationLink(destination: MusicDetailView(music: music)) {
                    HStack {
                        LazyImage(url: URL(string: music.album.cover_medium))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(music.title)
                                .font(.headline)
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
                        }
                    }
                }
                CustomBookmarkButton {
                    stateObject.saveBookmark(item: music)
                    self.showAlert = true
                    self.alert = Validation.showAlert(title: "Success", message: "Successfully saved to Bookmark")
                }
            }
        }
        .navigationBarTitle(observedObject.selectedSearchType == .music ? "Music List" : "Movies List")
        .alert(isPresented: $showAlert) {
            alert!
        }
    }
}

#Preview {
    ListView(observedObject: SearchIntent())
}
