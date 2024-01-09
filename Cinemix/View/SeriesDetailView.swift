//
//  SeriesDetailView.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/5/24.
//

import SwiftUI

struct SeriesDetailView: View {
    var series: SeriesResponse
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            CustomPrimaryText(text: series.title ?? "")
            
            LazyImage(url: series.image)
            
            CustomSecondayText(text: series.description ?? "")
            
            CustomSecondayText(text: "\(ListConstants.genre): \(series.genre.joined(separator: ", "))")
            
            CustomSecondayText(text: "\(ListConstants.rating): \(series.rating ?? 0)")
            
            CustomSecondayText(text: "\(ListConstants.year): \(series.year ?? "")")
        }
        .padding()
        .navigationBarTitle(ListConstants.navigationTextSeriesDetail, displayMode: .inline)
    }
}

//#Preview {
//    SeriesDetailView(series: SeriesResponse())
//}
