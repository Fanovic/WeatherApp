//
//  CitiesProtocols.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import Foundation


protocol CitiesViewProtocol {
    var presenter: CitiesPresenterProtocol? { get set }
    
    func showCities()
    func showError(_ error: String)
}

protocol CitiesPresenterProtocol {
    var view: CitiesViewProtocol? { get set }
    var interactor: CitiesInteractorProtocol? { get set }
    var router: CitiesRouterProtocol? { get set }
    var list: [City]? { get set }
    
    func getCities()
    func onRequestSuccess(_ cities: [City])
    func onRequestFailure(_ error: String)
    func showWeatherViewController(with city: String)
}

protocol CitiesInteractorProtocol {
    var presenter: CitiesPresenterProtocol? { get set }
    func fetch()
}



protocol CitiesRouterProtocol {
    var presenter: CitiesPresenterProtocol? { get set }
    func pushWeatherController(city: String)
}


protocol CitiesEntityProtocol {
    
}
