//
//  WeatherModule.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 15/12/2020.
//

import Foundation

import UIKit

class WeatherModule {
    
    class func build(selected: String)-> UIViewController {
        let view = WeatherViewController()
        let interactor = WeatherInteractor()
        let presenter = WeatherPresenter()
        let router = WeatherRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
               
        interactor.presenter = presenter
        view.presenter = presenter
        view.selectedCity = selected
        router.presenter = presenter
               
        return view
    }
}
