//
//  BookmarkView.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import SwiftUI

struct BookmarkView: View {
    @StateObject private var stateObject = BookmarkIntent()

    var body: some View {
        NavigationStack {
            List {
                ForEach(stateObject.bookmarks, id: \.self) { bookmark in
                    if let imageData = FileManagerClass.sharedInstance.loadMusicDataFromFileManager(relativePath: bookmark.bookmarkMusic ?? "") {
                        Image(uiImage: UIImage(data: imageData)!)
                            .resizable()
                            .frame(width: 300, height: 200)
                    }
                }
                .onDelete(perform: stateObject.deleteBookmark)
            }
            .onAppear {
                stateObject.fetchBookmarks()
            }
            .navigationBarTitle("Bookmarks")
        }
    }
}

#Preview {
    BookmarkView()
}
