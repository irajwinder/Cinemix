//
//  MovieDetailView.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/5/24.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: MovieResponse
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            CustomPrimaryText(text: movie.title ?? "")
            
            LazyImage(url: movie.image)
            
            CustomSecondayText(text: movie.description ?? "")
            
            CustomSecondayText(text: "\(ListConstants.genre): \(movie.genre.joined(separator: ", "))")
            
            CustomSecondayText(text: "\(ListConstants.rating): \(movie.rating ?? "")")
            
            CustomSecondayText(text: "\(ListConstants.year): \(movie.year ?? 0)")
        }
        .padding()
        .navigationBarTitle(ListConstants.navigationTextMovieDetail, displayMode: .inline)
    }
}

//#Preview {
//    MovieDetailView(movie: MovieResponse())
//}
