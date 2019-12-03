//
//  DetailWeatherViewController.swift
//  Unit3-JSONlab
//
//  Created by Liubov Kaper  on 12/2/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {
    
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var lowestTempLabel: UILabel!
    
    @IBOutlet weak var highestTempLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var cityWeatherInfo: WeatherDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        
        guard let weather = cityWeatherInfo else {
            fatalError("cityweather is nil, verify prepare for seque")
        }
        navigationItem.title = weather.name
        currentTempLabel.text = "Current temperature is \(weather.main.temp)"
        lowestTempLabel.text = "Lowest temperature today is \(weather.main.temp_min)"
        highestTempLabel.text = "Highest temperature today is \(weather.main.temp_max)"
        humidityLabel.text = "Humidity: \(weather.main.humidity)"
        pressureLabel.text = "Pressure: \(weather.main.pressure)"
        //descriptionLabel.text = weather.weather.main
    }
    
}
