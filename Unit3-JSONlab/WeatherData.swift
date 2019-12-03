//
//  WeatherData.swift
//  Unit3-JSONlab
//
//  Created by Liubov Kaper  on 11/26/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [WeatherDetails]
}

struct Weather: Codable {
    var description: String
}

struct Main: Codable {
    var temp: Double
    var temp_min: Double
    var temp_max: Double
    var humidity: Int
    var pressure: Double 
}

struct WeatherDetails: Codable {
    var name: String
    var main: Main
    var weather: [Weather]
    
}

extension WeatherData {
    static func getWeather() -> [WeatherDetails] {
        var weatherLines = [WeatherDetails]()
        
        guard let fileURL = Bundle.main.url(forResource: "weather", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
           // print(data)
            let cityWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            weatherLines = cityWeatherData.list
        } catch {
            fatalError("failed to load contents \(error)")
        }
       
        
        return weatherLines
    }
}
