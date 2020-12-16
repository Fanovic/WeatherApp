//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 15/12/2020.
//

import UIKit

class WeatherViewController: UIViewController, WeatherViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: WeatherPresenterProtocol?
    var selectedCity: String?
    
    func showWeather() {
        activityIndicator.stopAnimating()
        tableView.isHidden = false
        cityLabel.text = presenter?.weather?.city.name ?? ""
        tableView.reloadData()
    }
    
    func showError(_ error: String) {
        print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        title = "Weather"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        
        
        cityLabel.text = ""
        if let selected = selectedCity {
            activityIndicator.startAnimating()
            tableView.isHidden = true
            presenter?.getWeather(city: selected)
        }
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.weather?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherTableViewCell
        if let item = presenter?.weather?.list[indexPath.section] {
            let  weatherCell = WeatherCell(icon: item.weather[0].main, min: "\(item.main.minTemp)", max: "\(item.main.maxTemp)", date: item.dtText)
            cell.configure(with: weatherCell )
        }
            return cell
    }
    
    
}
