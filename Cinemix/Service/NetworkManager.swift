//
//  NetworkManager.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import Foundation

class NetworkManager : NSObject {
    
    static let sharedInstance : NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    func searchMusic(artistName: String, completion: @escaping (MusicResponse?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(APIConstants.musicBaseURL) + \(artistName)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = APIConstants.httpMethod
        request.allHTTPHeaderFields = APIConstants.musicHeader
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            // Decode JSON response
            let decodedResponse = APIManager.sharedInstance.decodeMusicResponse(data: data)
            completion(decodedResponse)
        })
        dataTask.resume()
    }
    
    func searchMovies(completion: @escaping ([MovieResponse]?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(APIConstants.movieBaseURL)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = APIConstants.httpMethod
        request.allHTTPHeaderFields = APIConstants.moviesHeader
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            // Decode JSON response
            let decodedResponse = APIManager.sharedInstance.decodeMovieResponse(data: data)
            completion(decodedResponse)
        })
        dataTask.resume()
    }
    
    func searchSeries(completion: @escaping ([SeriesResponse]?) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "\(APIConstants.seriesBaseURL)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = APIConstants.httpMethod
        request.allHTTPHeaderFields = APIConstants.moviesHeader
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            // Decode JSON response
            let decodedResponse = APIManager.sharedInstance.decodeSeriesResponse(data: data)
            completion(decodedResponse)
        })
        dataTask.resume()
    }
    
    //download images from a given URL
    func downloadImage(from url: URL, completion: @escaping (Data?) -> Void) {
        // Create a download task to download the image from the given URL
        let task = URLSession.shared.downloadTask(with: url) { localURL, response, error in
            guard let localURL = localURL, error == nil else {
                completion(nil)
                return
            }
            
            do {
                // Read the downloaded file and convert it to Data
                let imageData = try Data(contentsOf: localURL)
                // Pass the data to the completion block
                completion(imageData)
            } catch {
                print("Error converting downloaded file to Data: \(error.localizedDescription)")
                completion(nil)
            }
        }
        // Resume the download task to start the download
        task.resume()
    }
}
