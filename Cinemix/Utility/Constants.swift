//
//  Constants.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

struct SearchConstants {
    static let music = "Music"
    static let movie = "Movies"
    static let series = "Series"
    
    static let placeholderText = "Enter search text"
    static let pickerText = "Search Type"
    static let navigationText = "Search"
    
    static let errorTitle = "Error"
    static let errorMessage = "Enter Search Text"
    
}

struct ListConstants {
    static let singer = "Singer"
    static let album = "Album"
    static let duration = "Duration"
    static let genre = "Genre"
    static let rating = "Rating"
    static let year = "Year"
    
    static let navigationTextMusic = "Music List"
    static let navigationTextMovies = "Movies List"
    static let navigationTextMusicDetail = "Music Details"
    static let navigationTextMovieDetail = "Movie Details"
    static let navigationTextSeriesDetail = "Series Details"
    static let navigationTextBookmark = "Bookmark"
    
    static let successTitle = "Success"
    static let successMessage = "Successfully saved to Bookmark"
}

struct APIConstants {
    static let musicBaseURL = "https://deezerdevs-deezer.p.rapidapi.com/search?q="
    static let musicHeader = [
        "X-RapidAPI-Key": "ec6163ac92msh5a910695b398cadp1ff052jsnecb1c1f6797d",
        "X-RapidAPI-Host": "deezerdevs-deezer.p.rapidapi.com"
    ]
    
    static let movieBaseURL = "https://imdb-top-100-movies.p.rapidapi.com/"
    static let moviesHeader = [
        "X-RapidAPI-Key": "ec6163ac92msh5a910695b398cadp1ff052jsnecb1c1f6797d",
        "X-RapidAPI-Host": "imdb-top-100-movies.p.rapidapi.com"
    ]
    static let seriesBaseURL = "https://imdb-top-100-movies.p.rapidapi.com/series/"
    static let httpMethod = "GET"
}

struct MusicConstants {
}
struct MovieConstants {
}
struct SeriesConstants {
}


struct FileManagerConstants {
    static let folderName = "BookmarkedMusic"
    static let fileExtension = ".jpg"
    static let musicExtension = ".mp3"
}
