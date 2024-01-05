//
//  MusicModel.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import Foundation

// MARK: - MusicResponse
struct MusicResponse: Codable {
    let data: [Track]
    let total: Int
    let next: String
}

// MARK: - Track
struct Track: Codable {
    let id: Int
    let title: String
    let link: String
    let duration: Int
    let preview: String
    let artist: Artist
    let album: Album
}

// MARK: - Artist
struct Artist: Codable {
    let id: Int
    let name: String
    let link: String
    let picture: String
    let picture_small: String
    let picture_medium: String
    let picture_big: String
    let tracklist: String
}

// MARK: - Album
struct Album: Codable {
    let id: Int
    let title: String
    let cover: String
    let cover_small: String
    let cover_medium: String
    let cover_big: String
    let tracklist: String
}

//{
//  "data": [
//    {
//      "id": 6461440,
//      "readable": true,
//      "title": "Love The Way You Lie",
//      "title_short": "Love The Way You Lie",
//      "title_version": "",
//      "link": "https://www.deezer.com/track/6461440",
//      "duration": 263,
//      "rank": 945116,
//      "explicit_lyrics": true,
//      "explicit_content_lyrics": 1,
//      "explicit_content_cover": 1,
//      "preview": "https://cdns-preview-1.dzcdn.net/stream/c-1ed50e5b3118c99be858fc305609e62a-15.mp3",
//      "md5_image": "be682506145061814eddee648edb7c59",
//      "artist": {
//        "id": 13,
//        "name": "Eminem",
//        "link": "https://www.deezer.com/artist/13",
//        "picture": "https://api.deezer.com/artist/13/image",
//        "picture_small": "https://e-cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/56x56-000000-80-0-0.jpg",
//        "picture_medium": "https://e-cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/250x250-000000-80-0-0.jpg",
//        "picture_big": "https://e-cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/500x500-000000-80-0-0.jpg",
//        "picture_xl": "https://e-cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/1000x1000-000000-80-0-0.jpg",
//        "tracklist": "https://api.deezer.com/artist/13/top?limit=50",
//        "type": "artist"
//      },
//      "album": {
//        "id": 595243,
//        "title": "Recovery",
//        "cover": "https://api.deezer.com/album/595243/image",
//        "cover_small": "https://e-cdns-images.dzcdn.net/images/cover/be682506145061814eddee648edb7c59/56x56-000000-80-0-0.jpg",
//        "cover_medium": "https://e-cdns-images.dzcdn.net/images/cover/be682506145061814eddee648edb7c59/250x250-000000-80-0-0.jpg",
//        "cover_big": "https://e-cdns-images.dzcdn.net/images/cover/be682506145061814eddee648edb7c59/500x500-000000-80-0-0.jpg",
//        "cover_xl": "https://e-cdns-images.dzcdn.net/images/cover/be682506145061814eddee648edb7c59/1000x1000-000000-80-0-0.jpg",
//        "md5_image": "be682506145061814eddee648edb7c59",
//        "tracklist": "https://api.deezer.com/album/595243/tracks",
//        "type": "album"
//      },
//      "type": "track"
//    }
//  ],
//  "total": 314,
//  "next": "https://api.deezer.com/search?q=eminem&redirect_uri=http%253A%252F%252Fguardian.mashape.com%252Fcallback&index=25"
//}
