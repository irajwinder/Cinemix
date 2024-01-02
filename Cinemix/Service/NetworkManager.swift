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
        let request = NSMutableURLRequest(url: NSURL(string: "https://deezerdevs-deezer.p.rapidapi.com/search?q=\(artistName)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = APIConstants.headers
        
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
    
    //download images from a given URL
    func downloadImage(from url: URL, completion: @escaping (Data?) -> Void) {
        // Create a data task to download the image from the given URL
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            // Pass data to the completion block
            completion(data)
        }
        // Resume the data task to start the download
        task.resume()
    }
}
