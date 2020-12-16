//
//  Weather.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 15/12/2020.
//

import Foundation

struct WeatherResponse: Decodable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [Forecast]
    let city: City
}

struct Forecast: Decodable {
    let dt: Int
    let main: MainWeather
    let weather: [Weather]
    let dtText: String
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather
        case dtText = "dt_txt"
    }
    
}

struct MainWeather: Decodable {
    let temp: Float
    let minTemp: Float
    let maxTemp: Float
    let feelLike: Float
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
        case feelLike = "feels_like"
    }
}

struct Weather: Decodable {
    let main: String
    let description: String
}

struct City: Decodable {
    let id: Int
    let name: String
}


/**
 {
   "cod": "200",
   "message": 0,
   "cnt": 2,
   "list": [
     {
       "dt": 1608044400,
       "main": {
         "temp_kf": -0.41
       },
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "dt_txt": "2020-12-15 15:00:00"
     },
     {
       "dt": 1608055200,
       "main": {
         "temp": 17.57,
         "feels_like": 11.16,
         "temp_min": 17.57,
         "temp_max": 17.77,
         "pressure": 1014,
         "sea_level": 1014,
         "grnd_level": 1012,
         "humidity": 34,
         "temp_kf": -0.2
       },
       "weather": [
         {
           "id": 800,
           "main": "Clear",
           "description": "clear sky",
           "icon": "01d"
         }
       ],
       "clouds": {
         "all": 0
       },
       "wind": {
         "speed": 6.65,
         "deg": 166
       },
       "visibility": 10000,
       "pop": 0,
       "sys": {
         "pod": "d"
       },
       "dt_txt": "2020-12-15 18:00:00"
     }
   ],
   "city": {
     "id": 3430863,
     "name": "Mar del Plata",
     "coord": {
       "lat": -38.0023,
       "lon": -57.5575
     },
     "country": "AR",
     "population": 553935,
     "timezone": -10800,
     "sunrise": 1608020529,
     "sunset": 1608073753
   }
 }
 */
