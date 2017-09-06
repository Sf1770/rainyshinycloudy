//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Sabrina Fletcher on 9/6/17.
//  Copyright © 2017 Sabrina Fletcher. All rights reserved.
//

import Foundation
import CoreLocation

class Location{
    static var sharedInstance = Location()
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
