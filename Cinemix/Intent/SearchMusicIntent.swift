//
//  SearchMusicIntent.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

class SearchMusicIntent: ObservableObject {
    @Published var musicResponse: [Track] = []
    @Published var movieResponse: [MovieModel] = []
    
    @Published var searchText = ""
    @Published var selectedSearchType = SearchType.music
    
    func searchMusic() {
        NetworkManager.sharedInstance.searchMusic(artistName: searchText) { [weak self] response in
            guard let self = self, let response = response else {
                print("Failed to fetch music")
                return
            }
            DispatchQueue.main.async {
                self.musicResponse.append(contentsOf: response.data)
            }
            
            //            print(response.data)
            //            print(response.total)
            //            print(response.next)
            //            for track in response.data {
            //                print(track.artist)
            //            }
        }
    }
    
    func searchMovies() {
        
    }
}
