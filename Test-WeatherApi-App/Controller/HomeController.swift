//
//  ViewController.swift
//  Test-WeatherApi-App
//
//  Created by Marco Weinmann on 17.01.23.
//

import UIKit



class HomeController: UIViewController {
    
    private let viewModel = HomeViewModel()

    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var searchField: UITextField!
    
    var suchBegriff: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchWeather(for: "Berlin") { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
            }
        }
        
    }
    
    @IBAction func searchFieldAction(_ sender: Any) {
        suchBegriff = searchField.text!
        viewModel.fetchWeather(for: searchField.text ?? "Aalen") { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
            }
        }
    }
    
    private func setupUI() {
       setupHeader()
        setupSubHeader()
    }

    private func setupHeader() {
        tempLabel.text = viewModel.temperatureString
        nameLabel.text = viewModel.nameString
        suchBegriff = nameLabel.text!
    }

    private func setupSubHeader(){
        feelsLikeLabel.text = viewModel.feelsLikeTemperatureString
        minTempLabel.text = viewModel.minTemperatureString
        maxTempLabel.text = viewModel.maxTemperatureString
        pressureLabel.text = viewModel.pressureString
        humidityLabel.text = viewModel.humidityString
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForecast" {
            
            guard let destVc = segue.destination as? ForecastViewController else {return}
            
            destVc.suchBegriff = suchBegriff
        }
    }
}

