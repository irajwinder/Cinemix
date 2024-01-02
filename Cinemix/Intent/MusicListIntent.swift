//
//  MusicListIntent.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/2/24.
//

import Foundation

class MusicListIntent: ObservableObject {
    func saveBookmark<T: Codable>(item: T) {
        guard let imageURL = URL(string: getImageURL(item: item)) else {
            return
        }
        
        // Download image
        NetworkManager.sharedInstance.downloadImage(from: imageURL) { imageData in
            guard let imageData = imageData else {
                return
            }
            // Save the image data to FileManager
            if let relativeURL = FileManagerClass.sharedInstance.saveMusicToFileManager(imageData: imageData) {
                // Save the relative URL to CoreData
                DataManager.sharedInstance.saveBookmark(songURL: relativeURL)
            }
        }
    }
    
    func getImageURL<T: Codable>(item: T) -> String {
        if let music = item as? Track {
            return music.album.cover_medium
        } else {
            return ""
        }
    }
}
