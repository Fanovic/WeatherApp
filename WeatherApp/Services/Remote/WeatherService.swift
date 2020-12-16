//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import Foundation
import Alamofire
import PromiseKit


class WeatherService {
    
    class func fetchForecastByCity(with city: String) -> Promise<WeatherResponse> {
        return Promise { seal in
            //&cnt=5
            let url = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appid=1ed505a3c37743ec18ed18a24b08c3ab"
            AF.request(url).responseDecodable(of: WeatherResponse.self) { (response) in
                print(response)
                switch response.result {
                case .success(let response):
                    seal.fulfill(response)
                case .failure(let err):
                    seal.reject(err)
                }
            }
        }
    }
}
