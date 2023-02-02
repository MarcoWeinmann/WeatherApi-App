//
//  ForecastViewController.swift
//  Test-WeatherApi-App
//
//  Created by Marco Weinmann on 01.02.23.
//

import UIKit

class ForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weatherForecast: WeatherForecast?
    
    var data: WeatherForecast!
    
    var suchBegriff: String = ""
    
    private let viewModel = HomeViewModel()
    
    @IBOutlet weak var foreCastTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foreCastTableView.delegate = self
        foreCastTableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchWeatherForecast(for: "Berlin") { [weak self] in DispatchQueue.main.async {
            
            
            
            self!.viewModel.weatherForecast!.list.map{ element in
          
                if (self!.viewModel.weatherForecast!.list.firstIndex(where: {$0 == element}))! % 8 == 0{
                    print( (self!.viewModel.weatherForecast!.list.firstIndex(where: {$0 == element}))!)
                 //   self?.data.list.append(element)
                }
                
            }
            
            self?.setupUI()
            self!.foreCastTableView.reloadData()
        }
            
        }
    }
    
    private func setupUI() {
        
        let date = Date(timeIntervalSince1970: TimeInterval((viewModel.date)))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        
        let tage = viewModel.weatherForecast?.list
        
        
        //        dt3.text = tage![16].dt_txt
        //        dt4.text = tage![24].dt_txt
        //        dt5.text = tage![32].dt_txt
        
        
        //        temp1.text = String((weatherForecast?.list[1].main.temp_min ?? 0) +  viewModel.tempMaxStringForecast)
        //        temp2.text = String(viewModel.tempMinStringForecast +  viewModel.tempMaxStringForecast)
        //        temp3.text = String(viewModel.tempMinStringForecast +  viewModel.tempMaxStringForecast)
        //        temp4.text = String(viewModel.tempMinStringForecast +  viewModel.tempMaxStringForecast)
        //        temp5.text = String(viewModel.tempMinStringForecast +  viewModel.tempMaxStringForecast)
        ////
        //       description1.text = viewModel.descriptionString
        //        description2.text = viewModel.descriptionString
        //        description3.text = viewModel.descriptionString
        //        description4.text = viewModel.descriptionString
        //        description5.text = viewModel.descriptionString
    }
    
    
    
    
    //TODO
    //weitergeben von suchbegriff aus homecontroller in den forecasController
    //suchbegriff als Q aus Forecastnetworkcontroller setzen
    //
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.weatherForecast != nil {
       
            return viewModel.weatherForecast!.list.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForecast", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        if indexPath.row % 8 == 0 {
            let cellInput = viewModel.weatherForecast!.list[indexPath.row + 8]
            content.text = cellInput.dt_txt
            //   content.secondaryText = cellInput?.weather[indexPath.row].description
            cell.contentConfiguration = content
        }
        
        return cell
    }
    
}
