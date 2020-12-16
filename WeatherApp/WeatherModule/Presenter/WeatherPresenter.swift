//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 15/12/2020.
//

import Foundation


class WeatherPresenter:  WeatherPresenterProtocol {
    var view: WeatherViewProtocol?
    var interactor: WeatherInteractorProtocol?
    var router: WeatherRouterProtocol?
    var weather: WeatherDRO?
    
    func getWeather(city: String) {
        interactor?.fetch(self.removesSpaces(value: city))
    }
    
    func onRequestSuccess(dro: WeatherDRO) {
        weather = dro
        view?.showWeather()
    }
    
    func onRequestFailure(_ error: String) {
        view?.showError(error)
    }
    
    func removesSpaces(value: String) -> String {
        return value.replacingOccurrences(of: " ", with: "%20")
    }
    
}
