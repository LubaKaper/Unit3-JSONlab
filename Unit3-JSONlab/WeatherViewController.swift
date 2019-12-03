//
//  ViewController.swift
//  Unit3-JSONlab
//
//  Created by Liubov Kaper  on 11/26/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    var weatherInfo
        = [WeatherDetails]() {
        didSet {
            weatherTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.dataSource = self
        loadData()
    }

    func loadData() {
        weatherInfo = WeatherData.getWeather()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailWeatherVC = segue.destination as? DetailWeatherViewController, let indexPath = weatherTableView.indexPathForSelectedRow else {
            fatalError("error")
        }
        let info = weatherInfo[indexPath.row]
        detailWeatherVC.cityWeatherInfo = info 
    }
}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        let cityWeather = weatherInfo[indexPath.row]
        cell.textLabel?.text = cityWeather.name
        print(cityWeather.main)
        return cell
    }
}
