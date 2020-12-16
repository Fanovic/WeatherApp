//
//  CitiesInteractor.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import Foundation

class CitiesInteractor: CitiesInteractorProtocol {
    
    var presenter: CitiesPresenterProtocol?
    
    func fetch() {
        var list: [City] = []
        list.append(City(id: 3433955, name: "Buenos Aires"))
        list.append(City(id: 3833367, name: "Ushuaia"))
        list.append(City(id: 3849140, name: "La Quiaca"))
        list.append(City(id: 7116866, name: "Villa Mercedes"))
        list.append(City(id: 3430863, name: "Mar del Plata"))
        presenter?.onRequestSuccess(list)
    }
}
