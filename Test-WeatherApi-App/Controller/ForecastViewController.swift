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

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.weatherForecast != nil {
       
            return viewModel.weatherForecast!.list.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForecast", for: indexPath) as! MyTableViewCell
        
      
        

            let cellInput = viewModel.weatherForecast!.list[indexPath.row]
        
       // cell.iconView.image = UIImage(data: (cellInput.weather.last?.icon))
        
        cell.labelTime.text = cellInput.dt_txt
        cell.labelTemp.text = String(cellInput.main.temp_min) + "°C / " + String(cellInput.main.temp_max) + "°C"
        cell.labelDescription.text = cellInput.weather.last?.description
          
           
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
