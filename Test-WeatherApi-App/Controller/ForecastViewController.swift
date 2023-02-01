//
//  ForecastViewController.swift
//  Test-WeatherApi-App
//
//  Created by Marco Weinmann on 01.02.23.
//

import UIKit

class ForecastViewController: UIViewController {

    var weatherForecast: WeatherForecast?
    
    var suchBegriff: String = ""
    
    private let viewModel = HomeViewModel()
    
    @IBOutlet weak var dt1: UILabel!
    
    @IBOutlet weak var dt2: UILabel!
    
    @IBOutlet weak var dt3: UILabel!
    
    @IBOutlet weak var dt4: UILabel!
    
    @IBOutlet weak var dt5: UILabel!
    
    @IBOutlet weak var temp1: UILabel!
    
    @IBOutlet weak var temp2: UILabel!
    
    @IBOutlet weak var temp3: UILabel!
    
    @IBOutlet weak var temp4: UILabel!
    
    @IBOutlet weak var temp5: UILabel!
    
    @IBOutlet weak var description1: UILabel!
    
    @IBOutlet weak var description2: UILabel!
    
    @IBOutlet weak var description3: UILabel!
    
    @IBOutlet weak var description4: UILabel!
    
    @IBOutlet weak var description5: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchWeatherForecast(for: "Berlin") { [weak self] in DispatchQueue.main.async {
            self?.setupUI()
        }
            
        }
        
  
    }
    override func viewWillAppear(_ animated: Bool) {
        print(suchBegriff)
    }
    
    private func setupUI() {
        
        let date = Date(timeIntervalSince1970: TimeInterval((viewModel.date)))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        
        dt1.text = strDate
        dt2.text = strDate
        dt3.text = strDate
        dt4.text = strDate
        dt5.text = strDate
        
        
//        temp1.text = String((weatherForecast?.list[1].main.temp_min)! +  viewModel.tempMaxStringForecast)
//        temp2.text = String(viewModel.tempMinStringForecast +  viewModel.tempMaxStringForecast)
//        temp3.text = String(viewModel.tempMinStringForecast +  viewModel.tempMaxStringForecast)
//        temp4.text = String(viewModel.tempMinStringForecast +  viewModel.tempMaxStringForecast)
//        temp5.text = String(viewModel.tempMinStringForecast +  viewModel.tempMaxStringForecast)
//
//        description1.text = viewModel.descriptionString
//        description2.text = viewModel.descriptionString
//        description3.text = viewModel.descriptionString
//        description4.text = viewModel.descriptionString
//        description5.text = viewModel.descriptionString
    }
    

    

    //TODO
    //weitergeben von suchbegriff aus homecontroller in den forecasController
    //suchbegriff als Q aus Forecastnetworkcontroller setzen
    //
    

}
