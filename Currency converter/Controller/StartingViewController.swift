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
    // classes are initialized.
    let locationManager = CLLocationManager()
    var CurrencyList = currencyList()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        FetchLocation()
    }
    

    @IBAction func done(_ sender: UIButton) {
        performSegue(withIdentifier: "to_main", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        destinationVC.list = CurrencyList.list
        destinationVC.locationIndex = CurrencyList.locationListNumber!
        destinationVC.baceIndex = CurrencyList.baceListNumber
    }
    
    //Function to fetch currency information from API.
    func GetRates()  {
        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=\(CurrencyList.baceCurrency)")
        var request = URLRequest(url: url!)
        print(url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url!) { (data, URLResponse, Error) in
            let decoder = JSONDecoder()
            
            let decodedData = try! decoder.decode(JSONStruct.self, from: data!)
            //updating all the relativeRates in the currency list.
            self.CurrencyList.list[0].relativeRate = Float(decodedData.rates.USD)
            self.CurrencyList.list[1].relativeRate = Float(decodedData.rates.JPY)
            self.CurrencyList.list[2].relativeRate = Float(decodedData.rates.BGN)
            self.CurrencyList.list[3].relativeRate = Float(decodedData.rates.CZK)
            self.CurrencyList.list[4].relativeRate = Float(decodedData.rates.DKK)
            self.CurrencyList.list[5].relativeRate = Float(decodedData.rates.GBP)
            self.CurrencyList.list[6].relativeRate = Float(decodedData.rates.HUF)
            self.CurrencyList.list[7].relativeRate = Float(decodedData.rates.PLN)
            self.CurrencyList.list[8].relativeRate = Float(decodedData.rates.RON)
            self.CurrencyList.list[9].relativeRate = Float(decodedData.rates.SEK)
            self.CurrencyList.list[10].relativeRate = Float(decodedData.rates.CHF)
            self.CurrencyList.list[11].relativeRate = Float(decodedData.rates.ISK)
            self.CurrencyList.list[12].relativeRate = Float(decodedData.rates.NOK)
            self.CurrencyList.list[13].relativeRate = Float(decodedData.rates.HRK)
            self.CurrencyList.list[14].relativeRate = Float(decodedData.rates.RUB)
            self.CurrencyList.list[15].relativeRate = Float(decodedData.rates.TRY)
            self.CurrencyList.list[16].relativeRate = Float(decodedData.rates.AUD)
            self.CurrencyList.list[17].relativeRate = Float(decodedData.rates.BRL)
            self.CurrencyList.list[18].relativeRate = Float(decodedData.rates.CAD)
            self.CurrencyList.list[19].relativeRate = Float(decodedData.rates.CNY)
            self.CurrencyList.list[20].relativeRate = Float(decodedData.rates.HKD)
            self.CurrencyList.list[21].relativeRate = Float(decodedData.rates.IDR)
            self.CurrencyList.list[22].relativeRate = Float(decodedData.rates.ILS)
            self.CurrencyList.list[23].relativeRate = Float(decodedData.rates.INR)
            self.CurrencyList.list[24].relativeRate = Float(decodedData.rates.KRW)
            self.CurrencyList.list[25].relativeRate = Float(decodedData.rates.MXN)
            self.CurrencyList.list[26].relativeRate = Float(decodedData.rates.MYR)
            self.CurrencyList.list[27].relativeRate = Float(decodedData.rates.NZD)
            self.CurrencyList.list[28].relativeRate = Float(decodedData.rates.PHP)
            self.CurrencyList.list[29].relativeRate = Float(decodedData.rates.SGD)
            self.CurrencyList.list[30].relativeRate = Float(decodedData.rates.THB)
            self.CurrencyList.list[31].relativeRate = Float(decodedData.rates.ZAR)
            
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
    //function to find current location Country name using latitude and longitude and aanother API.
    func GetInfo(Lat: Double, Lon: Double) {
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=" + String(Lat) + "&lon=" + String(Lon) + "&appid=d15f2a7a7210e09094bed92c19b51846&units=metric")
        print("https://api.openweathermap.org/data/2.5/weather?lat=" + String(Lat) + "&lon=" + String(Lon) + "&appid=d15f2a7a7210e09094bed92c19b51846&units=metric")
        let session = URLSession(configuration: .default)
        
        
        
        let task = session.dataTask(with: url!) { (data, urlResponce, error) in
            let decoder = JSONDecoder()
            let decodedData = try! decoder.decode(LocationData.self, from: data!)
            self.CurrencyList.locationName = decodedData.sys.country
            self.CurrencyList.GetLocationListIndex(locationName: decodedData.sys.country)
            print(self.CurrencyList.locationListNumber!)
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
        CurrencyList.baceListNumber = row
        CurrencyList.baceCurrency = CurrencyList.list[row].currency
        GetRates()
    }
}
