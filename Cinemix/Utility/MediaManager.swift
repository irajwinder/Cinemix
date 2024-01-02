//
//  MediaManager.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/2/24.
//

import AVKit

class MediaManager {
    private static func getCurrentWindow() -> UIWindow? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return nil
        }
        // Get the first window in the window scene
        return windowScene.windows.first
    }
    
    static func playMedia(mediaURL: URL) {
        // Create an AVPlayer with the mediaURL
        let mediaPlayer = AVPlayer(url: mediaURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = mediaPlayer
        
        // Get the current window scene
        if let window = getCurrentWindow() {
            window.rootViewController?.present(playerViewController, animated: true) {
                mediaPlayer.play()
            }
        }
    }
}
