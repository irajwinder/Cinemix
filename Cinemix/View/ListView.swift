//
//  ListView.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

struct ListView: View {
    @StateObject private var stateObject = ListIntent()
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
                            CustomPrimaryText(text: music.title)
                            
                            CustomSecondayText(text: "\(ListConstants.singer): \(music.artist.name)")
                            
                            CustomSecondayText(text: "\(ListConstants.album): \(music.album.title)")
                            
                            CustomSecondayText(text: "\(ListConstants.duration): \(music.duration)")
                        }
                    }
                }
                CustomBookmarkButton {
                    stateObject.saveBookmark(item: music)
                    self.showAlert = true
                    self.alert = Validation.showAlert(title: ListConstants.successTitle, message: ListConstants.successMessage)
                }
            }
            
            ForEach(observedObject.movieResponse, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    HStack {
                        LazyImage(url: movie.image)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            CustomPrimaryText(text: movie.title ?? "")
                            
                            CustomSecondayText(text: "\(ListConstants.genre): \(movie.genre.joined(separator: ", "))")
                            
                            CustomSecondayText(text: "\(ListConstants.rating): \(movie.rating ?? "")")
                            
                            CustomSecondayText(text: "\(ListConstants.year): \(movie.year ?? 0)")
                        }
                    }
                }
                CustomBookmarkButton {
                    
                }
            }
            
            ForEach(observedObject.seriesResponse, id: \.id) { series in
                NavigationLink(destination: SeriesDetailView(series: series)) {
                    HStack {
                        LazyImage(url: series.image)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            CustomPrimaryText(text: series.title ?? "")
                            
                            CustomSecondayText(text: "\(ListConstants.genre): \(series.genre.joined(separator: ", "))")
                            
                            CustomSecondayText(text: "\(ListConstants.rating): \(series.rating ?? 0)")
                            
                            CustomSecondayText(text: "\(ListConstants.year): \(series.year ?? "")")
                        }
                    }
                }
                CustomBookmarkButton {
                    
                }
            }
        }
        .navigationBarTitle(observedObject.selectedSearchType == .music ? ListConstants.navigationTextMusic : ListConstants.navigationTextMovies)
        .alert(isPresented: $showAlert) {
            alert!
        }
    }
}

#Preview {
    ListView(observedObject: SearchIntent())
}
