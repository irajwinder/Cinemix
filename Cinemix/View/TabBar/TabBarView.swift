//
//  TabBarView.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            BookmarkView()
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark")
                }
        }
    }
}

#Preview {
    TabBarView()
}
