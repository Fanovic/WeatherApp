//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import Foundation


class CitiesPresenter: CitiesPresenterProtocol {
    
    var view: CitiesViewProtocol?
    var interactor: CitiesInteractorProtocol?
    var router: CitiesRouterProtocol?
    var list: [City]?
    
    func getCities() {
        interactor?.fetch()
    }
    
    func onRequestSuccess(_ cities: [City]) {
        list = cities
        view?.showCities()
    }
    
    func onRequestFailure(_ error: String) {
        view?.showError(error)
    }
    
    func showWeatherViewController(with city: String) {
        router?.pushWeatherController(city: self.removesSpaces(value: city))
    }
    
    func removesSpaces(value: String) -> String {
        return value.replacingOccurrences(of: " ", with: "%20")
    }
}
