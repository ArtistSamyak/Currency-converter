//
//  ViewController.swift
//  Currency converter
//
//  Created by Samyak Pawar on 14/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var list : [Currency] = [] // this is later given updated currenct list.
    var locationIndex : Int = 5 // index of current location in list array.
    var baceIndex : Int = 3// index of native country location in list array.
    var isReverced = false// used when user taps on "Change" button.
    @IBOutlet weak var foreign: UILabel!
    @IBOutlet weak var foreignText: UITextField!
    @IBOutlet weak var baceCountry: UILabel!
    @IBOutlet weak var baseAmount: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foreign.text = list[locationIndex].country
        baceCountry.text = list[baceIndex].country
        baseAmount.text = "0 \(list[baceIndex].currency)"
        foreignText.delegate = self
    }

    @IBAction func change(_ sender: UIButton) {
        
        foreignText.endEditing(true)
        var tempText = foreign.text
        foreign.text = baceCountry.text
        baceCountry.text = tempText
        
        foreignText.text = ""
        baseAmount.text = ""
        if isReverced == true{
            isReverced = false
        }else{
            isReverced = true
        }
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if foreignText.text != nil {
            let value = Float(foreignText.text!)!
            let rate : Float
            
            if isReverced == true {
                rate = list[locationIndex].relativeRate
                foreignText.text?.append(contentsOf: " \(list[baceIndex].currency)")
            }else{
                foreignText.text?.append(contentsOf: " \(list[locationIndex].currency)")
                rate = 1/list[locationIndex].relativeRate
            }
            print(rate)
            let amount = Float(value * rate)
            baseAmount.text = String(format: "%.2f", amount)
            if isReverced == true{
                baseAmount.text?.append(contentsOf: " \(list[locationIndex].currency)")

            }else{
                baseAmount.text?.append(contentsOf: " \(list[baceIndex].currency)")

            }
            
            foreignText.endEditing(true)
        }
        
       
        
        
        return true
    }
}

