//
//  APIManager.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//

import Foundation

class APIManager : NSObject {
    
    static let sharedInstance : APIManager = {
        let instance = APIManager()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    //Decode Music Response
    func decodeMusicResponse(data: Data) -> MusicResponse? {
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(MusicResponse.self, from: data)
            return decodedResponse
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
    //Decode Movie Response
    func decodeMovieResponse(data: Data) -> [MovieResponse]? {
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode([MovieResponse].self, from: data)
            return decodedResponse
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
    //Decode Series Response
    func decodeSeriesResponse(data: Data) -> [SeriesResponse]? {
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode([SeriesResponse].self, from: data)
            return decodedResponse
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
