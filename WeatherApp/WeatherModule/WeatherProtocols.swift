//
//  WeatherProtocols.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 15/12/2020.
//

import Foundation

protocol WeatherViewProtocol {
    var presenter: WeatherPresenterProtocol? { get set }
    
    func showWeather()
    func showError(_ error: String)
}

protocol WeatherPresenterProtocol {
    var view: WeatherViewProtocol? { get set }
    var interactor: WeatherInteractorProtocol? { get set }
    var router: WeatherRouterProtocol? { get set }
    var weather: WeatherDRO? { get set }
    
    func getWeather(city: String)
    func onRequestSuccess(dro: WeatherDRO)
    func onRequestFailure(_ error: String)
}

protocol WeatherInteractorProtocol {
    var presenter: WeatherPresenterProtocol? { get set }
    func fetch(_ city: String)
}

protocol WeatherRouterProtocol {
    var presenter: WeatherPresenterProtocol? { get set }
}

protocol WeatherEntityProtocol {
    
}
