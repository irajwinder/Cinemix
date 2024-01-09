//
//  Component.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

struct CustomPrimaryText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.primary)
    }
}

struct CustomSecondayText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}

struct CustomSearchField: View {
    var placeholder: String
    @Binding var searchText: String
    
    var body: some View {
        TextField(placeholder, text: $searchText)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .disableAutocorrection(true)
            .autocapitalization(.none)
    }
}

struct CustomSearchButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.blue)
                .imageScale(.large)
                .padding(8)
        }
    }
}

struct CustomBookmarkButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "bookmark")
                .foregroundColor(.blue)
                .imageScale(.large)
                .padding(8)
        }
    }
}

struct CustomPlayButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "play.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
        }
    }
}

struct LazyImage: View {
    @StateObject private var stateObject = LazyImageIntent()
    var url: URL?
    
    var body: some View {
        Image(uiImage: stateObject.image ?? UIImage(systemName: "photo")!)
            .resizable()
            .scaledToFit()
            .onAppear {
                if let url = url {
                    stateObject.loadImages(url: url)
                }
            }
    }
}
