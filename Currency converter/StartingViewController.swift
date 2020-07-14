//
//  StartingViewController.swift
//  Currency converter
//
//  Created by Samyak Pawar on 14/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import UIKit
import CoreLocation

class StartingViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var CurrencyList = currencyList()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        FetchLocation()
    }
    

    @IBAction func done(_ sender: UIButton) {
    }
    
    
    func GetRates()  {
        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=\(CurrencyList.bace)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url!) { (data, URLResponse, Error) in
            let decoder = JSONDecoder()
            
            let decodedData = try! decoder.decode(JSONStruct.self, from: data!)
            var i = self.CurrencyList.list
            for i in self.CurrencyList.list{
                if i.country == self.CurrencyList.location{
                    i.relativeRate = Float(decodedData.rates.BGN)
                }
            }
        }
        dataTask.resume()
    }
    
    
    func FetchLocation(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        locationManager.stopUpdatingLocation()
        let lat = location?.coordinate.latitude
        let long = location?.coordinate.longitude
        GetInfo(Lat: lat!, Lon: long!)
        
    }
    
    func GetInfo(Lat: Double, Lon: Double) {
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=" + String(Lat) + "&lon=" + String(Lon) + "&appid=d15f2a7a7210e09094bed92c19b51846&units=metric")
        let session = URLSession(configuration: .default)
        
        
        
        let task = session.dataTask(with: url!) { (data, urlResponce, error) in
            let decoder = JSONDecoder()
            let decodedData = try! decoder.decode(LocationData.self, from: data!)
            self.CurrencyList.location = decodedData.sys.country
            print("location updated!")
        }
        task.resume()
        
    }
    
    
    
    
    
    
}

extension StartingViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CurrencyList.list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CurrencyList.list[row].country
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(CurrencyList.list[row].country)
        CurrencyList.bace = CurrencyList.list[row].currency
        GetRates()
    }
}
