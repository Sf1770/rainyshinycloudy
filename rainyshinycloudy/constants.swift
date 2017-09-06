//
//  constants.swift
//  rainyshinycloudy
//
//  Created by Sabrina Fletcher on 8/22/17.
//  Copyright © 2017 Sabrina Fletcher. All rights reserved.
//

import Foundation


let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "3f90b111885d58af3e2746deb01d16a2"
let FORECAST_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let DAY_COUNT = "&cnt=10"

typealias  DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(WEATHER_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "\(FORECAST_BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(DAY_COUNT)\(APP_ID)\(API_KEY)"


