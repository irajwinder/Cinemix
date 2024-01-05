//
//  MovieModel.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let rank: Int
    let title: String
    let description: String
    let image: URL
    let bigImage: URL
    let genre: [String]
    let thumbnail: URL
    let rating: String
    let id: String
    let year: Int
    let imdbid: String
    let imdb_link: URL
}

// MARK: - SeriesResponse
struct SeriesResponse: Codable {
    let rank: Int
    let title: String
    let description: String
    let image: URL
    let big_image: URL
    let genre: [String]
    let thumbnail: URL
    let rating: Double
    let id: String
    let year: String
    let imdbid: String
    let imdb_link: URL
}

//[
//  {
//    "rank": 1,
//    "title": "The Shawshank Redemption",
//    "description": "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
//    "image": "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,1,380,562_.jpg",
//    "big_image": "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@",
//    "genre": [
//      "Drama"
//    ],
//    "thumbnail": "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg",
//    "rating": "9.3",
//    "id": "top1",
//    "year": 1994,
//    "imdbid": "tt0111161",
//    "imdb_link": "https://www.imdb.com/title/tt0111161"
//  },
//  {
//    "rank": 2,
//    "title": "The Godfather",
//    "description": "The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.",
//    "image": "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UY562_CR8,0,380,562_.jpg",
//    "big_image": "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_QL75_UY562_CR8,0,380,562_.jpg",
//    "genre": [
//      "Crime",
//      "Drama"
//    ],
//    "thumbnail": "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY67_CR1,0,45,67_AL_.jpg",
//    "rating": "9.2",
//    "id": "top2",
//    "year": 1972,
//    "imdbid": "tt0068646",
//    "imdb_link": "https://www.imdb.com/title/tt0068646"
//  }
//]

//[
//  {
//    "rank": 1,
//    "title": "Breaking Bad",
//    "description": "A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student in order to secure his family's future.",
//    "image": "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_QL75_UX380_CR0,1,380,562_.jpg",
//    "big_image": "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5",
//    "genre": [
//      "Crime",
//      "Drama",
//      "Thriller"
//    ],
//    "thumbnail": "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_UY67_CR0,0,45,67_AL_.jpg",
//    "rating": 9.5,
//    "id": "top1",
//    "year": "2008-2013",
//    "imdbid": "tt0903747",
//    "imdb_link": "https://www.imdb.com/title/tt0903747"
//  },
//  {
//    "rank": 2,
//    "title": "Planet Earth II",
//    "description": "David Attenborough returns with a new wildlife documentary that shows life in a variety of habitats.",
//    "image": "https://m.media-amazon.com/images/M/MV5BMGZmYmQ5NGQtNWQ1MC00NWZlLTg0MjYtYjJjMzQ5ODgxYzRkXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_QL75_UX380_CR0,1,380,562_.jpg",
//    "big_image": "https://m.media-amazon.com/images/M/MV5BMGZmYmQ5NGQtNWQ1MC00NWZlLTg0MjYtYjJjMzQ5ODgxYzRkXkEyXkFqcGdeQXVyNjAwNDUxODI@",
//    "genre": [
//      "Documentary"
//    ],
//    "thumbnail": "https://m.media-amazon.com/images/M/MV5BMGZmYmQ5NGQtNWQ1MC00NWZlLTg0MjYtYjJjMzQ5ODgxYzRkXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_UY67_CR0,0,45,67_AL_.jpg",
//    "rating": 9.5,
//    "id": "top2",
//    "year": "2016",
//    "imdbid": "tt5491994",
//    "imdb_link": "https://www.imdb.com/title/tt5491994"
//  }
//]
