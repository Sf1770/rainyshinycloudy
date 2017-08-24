//
//  ViewController.swift
//  rainyshinycloudy
//
//  Created by Sabrina Fletcher on 8/22/17.
//  Copyright © 2017 Sabrina Fletcher. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var locationLBL: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLBL: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails{
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else{
            return WeatherCell()
        }

    }

    func downloadForecastData(completed: @escaping DownloadComplete){
        let forecastURL = URL(string: FORECAST_URL)
        Alamofire.request(forecastURL!).responseJSON{ response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list  = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list{
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    
    func updateMainUI() {
        dateLBL.text = currentWeather.date
        currentTemp.text = "\(currentWeather.currentTemp)"
        currentWeatherLBL.text = currentWeather.weatherType
        locationLBL.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)

    }
    



}

