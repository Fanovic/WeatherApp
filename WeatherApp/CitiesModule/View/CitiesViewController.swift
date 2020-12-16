//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Lucas Fanovich on 14/12/2020.
//

import UIKit
import PromiseKit

class CitiesViewController: UIViewController, CitiesViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: CitiesPresenterProtocol?
    var list: [City]?
    
    func showCities() {
        list = presenter?.list ?? []
        tableView.reloadData()
    }
    
    func showError(_ error: String) {
        print(error)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configureTableView()
        presenter?.getCities()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list?[indexPath.section].name ?? "s/n"
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let city =  list?[indexPath.section].name {
            presenter?.showWeatherViewController(with: city)
        }
    }
}
