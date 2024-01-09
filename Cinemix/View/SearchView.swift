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
                    CustomSearchField(placeholder: SearchConstants.placeholderText, searchText: $stateObject.searchText)
                    
                    CustomSearchButton {
                        validateSearch()
                    }
                }
                
                Picker(SearchConstants.pickerText, selection: $stateObject.selectedSearchType) {
                    ForEach(SearchType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
            }
            .navigationBarTitle(SearchConstants.navigationText)
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
        if stateObject.selectedSearchType == .music {
            guard Validation.isValidName(stateObject.searchText) else {
                showAlert = true
                alert = Validation.showAlert(title: SearchConstants.errorTitle, message: SearchConstants.errorMessage)
                return
            }
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
