//
//  SearchIntent.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

class SearchIntent: ObservableObject {
    @Published var musicResponse: [Track] = []
    @Published var movieResponse: [MovieResponse] = []
    @Published var seriesResponse: [SeriesResponse] = []
    
    @Published var searchText = ""
    @Published var selectedSearchType = SearchType.music
    
    func searchMusic() {
        NetworkManager.sharedInstance.searchMusic(artistName: searchText) { [weak self] response in
            guard let self = self, let response = response else {
                print("Failed to fetch Music")
                return
            }
            DispatchQueue.main.async {
                self.musicResponse = response.data
            }
        }
    }
    
    func searchMovies() {
        NetworkManager.sharedInstance.searchMovies { [weak self] response in
            guard let self = self, let response = response else {
                print("Failed to fetch Movies")
                return
            }
            DispatchQueue.main.async {
                self.movieResponse = response
            }
        }
    }
    
    func searchSeries() {
        NetworkManager.sharedInstance.searchSeries { [weak self] response in
            guard let self = self, let response = response else {
                print("Failed to fetch Series")
                return
            }
            DispatchQueue.main.async {
                self.seriesResponse = response
            }
        }
    }
}
