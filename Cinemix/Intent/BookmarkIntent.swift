//
//  BookmarkIntent.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/2/24.
//

import SwiftUI

class BookmarkIntent: ObservableObject {
    @Published var bookmarks: [Bookmark] = []
    
    func fetchBookmarks() {
        bookmarks = DataManager.sharedInstance.fetchBookmark()
    }
    
    func deleteBookmark(offsets: IndexSet) {
        offsets.forEach { index in
            let bookmark = bookmarks[index]
            
            // Delete from FileManager
            FileManagerClass.sharedInstance.deleteMusicFromFileManager(relativePath: bookmark.bookmarkMusic ?? "")
            
            // Delete from CoreData
            DataManager.sharedInstance.deleteEntity(bookmark)
        }
        
        // Update the local array after deletion
        bookmarks.remove(atOffsets: offsets)
    }
}
