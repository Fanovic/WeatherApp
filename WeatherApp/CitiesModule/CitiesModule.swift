//
//  CitiesModule.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import Foundation
import UIKit

class CitiesModule {
    
    class func build()-> UIViewController {
        let view = CitiesViewController()
        let interactor = CitiesInteractor()
        let presenter = CitiesPresenter()
        let router = CitiesRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
               
        interactor.presenter = presenter
        view.presenter = presenter
        router.presenter = presenter
        router.viewController = view
               
        return view
    }
}
