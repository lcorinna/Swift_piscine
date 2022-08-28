//
//  NetworkManager.swift
//  ex00
//
//  Created by Lashaun Corinna on 8/21/22.
//

import Foundation
import RecastAI
import ForecastIO

class NetworkManager {
    
    let bot = RecastAIClient(token : "3cd97a9f54ceeffbdf17d56aa2c898d4", language: "en")
    let client = DarkSkyClient(apiKey: "76637466482e672bcc9f936626f6c40d")
    
    func getLocation(_ text: String, completion: @escaping ((String) -> Void)) {
        bot.textRequest(
            text,
            successHandler: { [weak self] (response) in
                print(response)
                
                guard let location = response.all(entity: "location") else {
                    completion("Error")
                    return
                }
                
                guard let latitude = location[0]["lat"] as? Double,
                      let longitude = location[0]["lng"] as? Double,
                      let raw = location[0]["raw"] as? String
                else {
                    completion("Error")
                    return
                }
                
                self?.getWeather(latitude, longitude, raw) { (response) in
                    completion(response)
                }
            },
            failureHandle: { (error) in
                print(error)
                completion("Error")
            }
        )
    }
    
    func getWeather(_ latitude: Double, _ longitude: Double, _ city: String, completion: @escaping ((String) -> Void)) {
        client.getForecast(
            location: .init(latitude: latitude, longitude: longitude),
            completion: { result in
                switch result {
                case .success((let currentForecast, _)):
                    if let summary = currentForecast.currently?.summary {
                        let answerLabel = "It's " + summary + " in " + city
                        completion(answerLabel)
                    } else {
                        completion("Error")
                    }
                case .failure( _):
                    completion("Error")
                }
            })
    }
}
