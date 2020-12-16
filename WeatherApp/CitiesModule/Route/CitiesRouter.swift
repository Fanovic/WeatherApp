//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import Foundation
import UIKit

class CitiesRouter: CitiesRouterProtocol {
  
    
    var presenter: CitiesPresenterProtocol?
    weak var viewController: UIViewController?
    
    func pushWeatherController(city: String) {
            viewController?.navigationController?.pushViewController(WeatherModule.build(selected: city), animated: true)
    }
}
