//
//  CitiesProtocols.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import Foundation


protocol CitiesViewProtocol {
    var presenter: CitiesPresenterProtocol? { get set }
//    func endSearchForecast( forecast: ForecastResponse)
//    func endSearchForecastWithErrors( error: String)
}

protocol CitiesInteractorProtocol {
    var presenter: CitiesPresenterProtocol? { get set }
    
//    func getForecast(city: String)
}

protocol CitiesPresenterProtocol {
    var view: CitiesViewProtocol? { get set }
    var interactor: CitiesInteractorProtocol? { get set }
    var router: CitiesRouterProtocol? { get set }
    
    //view
//    func startSearh(city name: String)
//    func showForecastController( with forecast: ForecastResponse, navigationController: UINavigationController?)
    
    //interactor
//    func endSearch(forecast: ForecastResponse)
//    func endSearchWithErrors( error: String)
}

protocol CitiesRouterProtocol {
    var presenter: CitiesPresenterProtocol? { get set }
//    func showForecastController(with forecast: ForecastResponse, navigation: UINavigationController?)
}


protocol CitiesEntityProtocol {
    
}
