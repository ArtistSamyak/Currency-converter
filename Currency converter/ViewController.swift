//
//  ViewController.swift
//  Currency converter
//
//  Created by Samyak Pawar on 14/07/20.
//  Copyright © 2020 ArtistSamyak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var list : [Currency] = []
    var locationIndex : Int = 5
    var baceIndex : Int = 3
    var isReverced = false
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
        isReverced = true
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if foreignText.text != nil {
            let value = Float(foreignText.text!)!
            let rate : Float
            foreignText.text?.append(contentsOf: " \(list[locationIndex].currency)")
            if isReverced == true {
                rate = list[locationIndex].relativeRate
            }else{
                rate = 1/list[locationIndex].relativeRate
            }
            print(rate)
            let amount = Float(value * rate)
            baseAmount.text = String(format: "%.2f", amount)
            baseAmount.text?.append(contentsOf: " \(list[baceIndex].currency)")
            foreignText.endEditing(true)
        }
        
       
        
        
        return true
    }
}

