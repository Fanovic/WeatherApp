//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import UIKit

class CitiesViewController: UIViewController, CitiesViewProtocol {
    var presenter: CitiesPresenterProtocol?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

}
