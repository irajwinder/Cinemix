//
//  SearchView.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

enum SearchType: String, CaseIterable {
    case music = "Music"
    case movie = "Movies"
    case series = "Series"
}

struct SearchView: View {
    @StateObject private var stateObject = SearchIntent()
    @State private var navigateToListView = false
    @State private var showAlert = false
    @State private var alert: Alert?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    CustomSearchField(placeholder: "Enter search text", searchText: $stateObject.searchText)
                    
                    CustomSearchButton {
                        validateSearch()
                    }
                }
                
                Picker("Search Type", selection: $stateObject.selectedSearchType) {
                    ForEach(SearchType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
            }
            .navigationBarTitle("Search")
            .alert(isPresented: $showAlert) {
                alert!
            }
            .navigationDestination(isPresented: $navigateToListView) {
                ListView(observedObject: stateObject)
            }
            .padding()
            .onAppear {
                stateObject.musicResponse = []
                stateObject.movieResponse = []
                
                let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                print(paths[0])
            }
        }
    }
    
    func validateSearch() {
        guard Validation.isValidName(stateObject.searchText) else {
            showAlert = true
            alert = Validation.showAlert(title: "Error", message: "Enter Search Text")
            return
        }
        
        switch stateObject.selectedSearchType {
        case .music:
            stateObject.searchMusic()
            navigateToListView = true
        case .movie:
            stateObject.searchMovies()
            navigateToListView = true
        case .series:
            stateObject.searchSeries()
            navigateToListView = true
        }
    }
}

#Preview {
    SearchView()
}
