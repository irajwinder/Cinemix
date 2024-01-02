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
}
