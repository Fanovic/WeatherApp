//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 15/12/2020.
//

import Foundation
import PromiseKit


class WeatherInteractor: WeatherInteractorProtocol {
    var presenter: WeatherPresenterProtocol?
    
    func fetch(_ city: String) {
        firstly {
            WeatherService.fetchForecastByCity(with: city)
        }.done { (response) in
            self.presenter?.onRequestSuccess(dro: WeatherDRO(list: response.list, city: response.city))
        }.catch { (error) in
            self.presenter?.onRequestFailure(error.localizedDescription)
        }
    }
    
    
}
